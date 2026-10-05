# BizPilot

BizPilot is a multi-tenant small-business management MVP for sales, stock, expenses, customers, reports, and verified business insights.

## Current status

The repository contains a runnable Flutter UI shell, responsive navigation, Zambia demo data, repository boundaries, failure model, sync/AI contracts, and a Supabase/PostgreSQL migration with RLS. The demo repository is intentionally local and replaceable.

## Unfinished external integrations

- Supabase Auth/session wiring and remote repository implementation
- Drift generated database and production sync worker
- Atomic Supabase sale RPC and server-side role/limit enforcement
- Real AI provider through a server function
- Payment gateways (mobile money, Stripe, ACH, cards)
- Messaging/WhatsApp reminder provider
- Subscription billing

These are documented extension points, not fake successful integrations.

## Build an IPA with GitHub Actions

The repository includes `.github/workflows/build-ios.yml`. Push the project to GitHub, open the **Actions** tab, select **Build iOS IPA**, and choose **Run workflow**. GitHub will use a macOS runner and upload `bizpilot-ios-unsigned` under the completed workflow's **Artifacts** section.

This produces an unsigned IPA for build validation. TestFlight/App Store distribution requires Apple signing certificates and provisioning profiles; configure those in a separate signed-release workflow before distributing the app.
