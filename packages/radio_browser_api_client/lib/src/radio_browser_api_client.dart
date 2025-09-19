import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:radio_browser_api_client/radio_browser_api_client.dart';

/// {@template radio_browser_api_exception }
/// Exception for Radio Browser client.
/// {@endtemplate}
class RadioBrowserApiException implements Exception {
  /// {@macro radio_browser_api_exception}
  const RadioBrowserApiException(this.message);

  /// The error message.
  final String message;

  @override
  String toString() => 'RadioBrowserApiException: $message';
}

/// {@template radio_browser_api_client }
/// A minimal Dart API Client for the Radio Browser API.
///
/// Docs:
/// - Mirrors & DNS: https://api.radio-browser.info/  (see "Do a DNS-lookup of all.api.radio-browser.info")
/// - REST endpoints: https://docs.radio-browser.info/
/// {@endtemplate}
class RadioBrowserApiClient {
  /// {@macro radio_browser_api_client}
  RadioBrowserApiClient({http.Client? httpClient, String? userAgent})
    : _httpClient = httpClient ?? http.Client(),
      _userAgent = userAgent ?? 'radio-browser-dart/1.0 (+github:arturograu)';

  final http.Client _httpClient;
  final String _userAgent;

  static const _knownMirrors = [
    'de1.api.radio-browser.info',
    'fi1.api.radio-browser.info',
    'nl1.api.radio-browser.info',
  ];

  /// Selected mirror host, e.g. "de1.api.radio-browser.info".
  String? _mirrorHost;

  Map<String, String> get _headers => {
    HttpHeaders.userAgentHeader: _userAgent,
    HttpHeaders.acceptHeader: 'application/json',
  };

  /// Initialize the client by selecting a mirror host.
  Future<void> initialize() async {
    if (_mirrorHost != null) return;

    final serversList = await _getServersList();
    final candidates = serversList.map((e) => e.name).toList();
    if (candidates.isEmpty) candidates.addAll(_knownMirrors);
    _mirrorHost = await _chooseMirrorHost(candidates);
    if (_mirrorHost == null) {
      throw const RadioBrowserApiException('No Radio Browser mirror reachable');
    }
  }

  Future<List<Server>> _getServersList() async {
    final serversUri = Uri.https(_knownMirrors.first, '/json/servers');

    try {
      final response = await _httpClient
          .get(serversUri, headers: _headers)
          .timeout(const Duration(seconds: 5));
      final jsonResponse = json.decode(response.body) as List;
      return jsonResponse
          .map((e) => Server.fromJson(e as Map<String, dynamic>))
          .toList();
    } on Exception catch (_) {
      throw const RadioBrowserApiException(
        'Unexpected servers response format',
      );
    }
  }

  Future<String> _chooseMirrorHost(List<String> candidates) async {
    if (candidates.isEmpty) candidates.addAll(_knownMirrors);
    final shuffled = [...candidates]..shuffle();

    // Race all probes. The stream yields results as each finishes.
    // The stream is closed when the first good host is found.
    final firstGood = await Stream.fromFutures(
      shuffled.map(_probeMirrorHost),
    ).firstWhere((h) => h != null, orElse: () => null);

    if (firstGood == null) {
      throw StateError('No reachable mirrors');
    }

    return firstGood;
  }

  Future<String?> _probeMirrorHost(String host) async {
    try {
      final uri = Uri.https(host, '/json/stats');
      final res = await _httpClient
          .get(uri, headers: _headers)
          .timeout(const Duration(seconds: 3));

      if (res.statusCode == HttpStatus.ok) return host;
    } on Exception catch (_) {
      // swallow and let other probes race
    }

    return null;
  }

  /// A list of the stations that are clicked the most.
  ///
  /// Set [limit] to how many you want (default 20).
  /// Set [hideBroken] to skip broken streams.
  Future<List<RadioStation>> listTopStations({
    int limit = 20,
    bool hideBroken = true,
  }) async {
    final response = await _httpGetJsonList(
      '/json/stations/topclick',
      queryParameters: {
        'limit': '$limit',
        if (hideBroken) 'hidebroken': 'true',
      },
    );

    return response
        .map((e) => RadioStation.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<dynamic>> _httpGetJsonList(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final host = _mirrorHost;
    if (host == null) {
      throw const RadioBrowserApiException(
        'Client not initialized. Call initialize() first.',
      );
    }

    final uri = Uri.https(host, path, queryParameters);
    http.Response response;

    try {
      response = await _httpClient.get(uri, headers: _headers);
    } on Exception catch (e) {
      throw RadioBrowserApiException('HTTP GET failed: $e');
    }

    if (response.statusCode != HttpStatus.ok) {
      throw RadioBrowserApiException('HTTP ${response.statusCode} for $uri');
    }

    try {
      return json.decode(response.body) as List<dynamic>;
    } on Exception catch (_) {
      throw RadioBrowserApiException('Failed to decode JSON from $uri');
    }
  }
}
