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
abstract class UserRepository {
  /// {@macro user_repository}
  const UserRepository();

  // TODO: Add user-related methods here as needed
}
