# Security

Do not trust client-supplied business IDs. Supabase policies derive access from `auth.uid()` and `business_members`. Service credentials and AI keys belong in server functions/environment variables, never Flutter source. Production sales must use an atomic server transaction and idempotency key.
