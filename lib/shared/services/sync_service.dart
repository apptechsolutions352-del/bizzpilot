import 'dart:async';
abstract interface class SyncService {
  Future<void> enqueue({required String operation, required String entityType, required String entityId, required Map<String, dynamic> payload, required String idempotencyKey});
  Future<void> synchronize();
  Stream<SyncStatus> get status;
}
enum SyncStatus { idle, syncing, complete, failed }
