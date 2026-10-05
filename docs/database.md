# Database

`supabase/migrations/202610050001_initial_schema.sql` creates the multi-tenant schema, indexes, membership helper, and RLS. Every business-owned table includes `business_id`. Sale creation should be exposed as a server-side transaction/RPC that validates membership, stock, sale items, payments, and inventory movements atomically.
