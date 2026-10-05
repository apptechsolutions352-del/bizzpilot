# Offline synchronization

Drift is the intended local source of truth. Each mutation writes its entity and a pending operation in the same SQLite transaction. Operations contain a client UUID and idempotency key. A `SyncService` retries in order, treats an already-applied idempotency key as success, records failures for user visibility, and marks operations synchronized only after server acknowledgement.
