import 'package:freezed_annotation/freezed_annotation.dart';

part 'server.freezed.dart';
part 'server.g.dart';

/// Server model
@freezed
sealed class Server with _$Server {
  const factory Server({
    required String name,
    required String ip,
  }) = _Server;

  factory Server.fromJson(Map<String, dynamic> json) => _$ServerFromJson(json);
}
