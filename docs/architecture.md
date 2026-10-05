# BizPilot architecture

BizPilot uses feature-first Flutter layers. Screens depend on Riverpod providers, providers depend on domain use cases/repository interfaces, and data implementations are replaceable. Supabase is an adapter, not a UI dependency.

The current local app uses `DemoBusinessRepository` so the shell is useful without credentials. The production adapter should implement `BusinessRepository` using Supabase RPCs and Drift-backed local repositories.

Financial calculations use sale-time `unit_cost`, never the current product cost. Currency and timezone are business settings and must flow through formatting services.
