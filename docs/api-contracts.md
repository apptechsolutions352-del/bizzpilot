# API contracts

The first server RPC should be `complete_sale`: accept a client sale UUID, business membership context from JWT, line items, discount, payment method, customer, and idempotency key; return the persisted sale, payment, and inventory movement IDs. Repeating the same idempotency key must return the original result.

Other adapters should preserve the domain repository contracts. This keeps Supabase, a custom backend, Stripe, mobile-money providers, and AI providers outside presentation code.
