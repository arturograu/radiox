import 'dart:async';
import 'dart:convert';

import 'package:radio_stations_repository/radio_stations_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_repository/src/models/models.dart';

/// Exception thrown when user operations fail.
class UserRepositoryException implements Exception {
  /// {@macro user_repository_exception}
  const UserRepositoryException(this.message);

  /// The error message.
  final String message;

  @override
  String toString() => 'UserRepositoryException: $message';
}

/// {@template user_repository}
/// A repository that handles user data operations.
/// {@endtemplate}
class UserRepository {
  /// {@macro user_repository}
  UserRepository({SharedPreferences? sharedPreferences})
    : _sharedPreferences = sharedPreferences,
      _favoriteRadioStations = <FavoriteRadioStation>[] {
    _favoritesController = StreamController<List<RadioStation>>.broadcast();
  }

  static const String _favoritesKey = 'favorite_radio_stations';

  final SharedPreferences? _sharedPreferences;
  final List<FavoriteRadioStation> _favoriteRadioStations;
  late final StreamController<List<RadioStation>> _favoritesController;

  /// Initializes the repository by loading data from local storage.
  Future<void> initialize() async {
    final prefs = _sharedPreferences ?? await SharedPreferences.getInstance();
    final savedFavoritesJson = prefs.getStringList(_favoritesKey) ?? <String>[];
    final savedFavorites = savedFavoritesJson
        .map(
          (json) => FavoriteRadioStation.fromJson(
            jsonDecode(json) as Map<String, dynamic>,
          ),
        )
        .toList();

    _favoriteRadioStations
      ..clear()
      ..addAll(savedFavorites);

    _favoritesController.add(
      _favoriteRadioStations.map((fav) => fav.toRadioStation()).toList(),
    );
  }

  /// Adds a radio station to the user's favorites.
  Future<void> addFavoriteRadioStation(RadioStation radioStation) async {
    if (!_favoriteRadioStations.any(
      (station) => station.id == radioStation.id,
    )) {
      final favoriteRadioStation = FavoriteRadioStation.fromRadioStation(
        radioStation,
      );
      _favoriteRadioStations.add(favoriteRadioStation);
      await _saveToStorage();
      _notifyFavoritesChanged();
    }
  }

  /// Removes a radio station from the user's favorites.
  Future<void> removeFavoriteRadioStation(String radioStationId) async {
    final initialLength = _favoriteRadioStations.length;
    _favoriteRadioStations.removeWhere(
      (station) => station.id == radioStationId,
    );
    if (_favoriteRadioStations.length < initialLength) {
      await _saveToStorage();
      _notifyFavoritesChanged();
    }
  }

  /// Checks if a radio station is in the user's favorites.
  bool isFavoriteRadioStation(String radioStationId) {
    return _favoriteRadioStations.any(
      (station) => station.id == radioStationId,
    );
  }

  /// Provides a [Stream] of the user's favorite radio stations.
  /// Emits only when the favorites change.
  Stream<List<RadioStation>> get favoriteRadioStations {
    return _favoritesController.stream;
  }

  Future<void> _saveToStorage() async {
    final prefs = _sharedPreferences ?? await SharedPreferences.getInstance();
    final favoritesJson = _favoriteRadioStations
        .map((station) => jsonEncode(station.toJson()))
        .toList();

    await prefs.setStringList(_favoritesKey, favoritesJson);
  }

  void _notifyFavoritesChanged() {
    _favoritesController.add(
      _favoriteRadioStations.map((fav) => fav.toRadioStation()).toList(),
    );
  }

  /// Disposes the repository and closes streams.
  Future<void> dispose() async {
    await _favoritesController.close();
  }
}
