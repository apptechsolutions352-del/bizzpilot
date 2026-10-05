sealed class AppFailure implements Exception {
  const AppFailure(this.message);
  final String message;
}
class ValidationFailure extends AppFailure {
  const ValidationFailure(super.message);
}
class UnauthorizedFailure extends AppFailure {
  const UnauthorizedFailure() : super('You do not have permission for this action.');
}
class NetworkFailure extends AppFailure {
  const NetworkFailure() : super('Network unavailable. Changes will sync when you reconnect.');
}
class InsufficientStockFailure extends AppFailure {
  const InsufficientStockFailure() : super('There is not enough stock for this sale.');
}
class SyncFailure extends AppFailure {
  const SyncFailure(super.message);
}
