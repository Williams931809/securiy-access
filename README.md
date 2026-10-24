# H Access — Hamthel Residence

Standalone residential access and estate management application.

## Existing production application
- Website: https://residence.hamthelholdings.com
- Vercel project: `hamthel-residence`
- Supabase project reference: `xycuhwmzcjhskauptoaa`

**Important:** The full current production frontend has not yet been imported into this repository. Do not deploy this README-only repository over the production website.

## Rent and estate management backend
The existing Supabase database includes:
- `estate_units` — apartments, rent amount, monthly/yearly rent cycle
- `estate_tenancies` — tenant-to-unit assignments
- `estate_invoices` — rent and other estate bills
- `estate_payments` — tenant bank-transfer submissions, pending/confirmed/rejected review
- `estate_announcements` — estate notices

The `public.estate_confirm_payment(p_payment uuid,p_approve boolean,p_note text)` RPC validates admin authorization, records payment review, prevents overpayment, and creates the next monthly/yearly rent invoice once the current rent invoice is fully paid. The next period begins at the previous period's end, not the late payment date.

## Frontend integration checklist
1. Import the complete current production frontend before editing or deploying.
2. Preserve visitor QR/PIN generation, gate verification, admin, security, resident, and existing authentication screens.
3. Add a resident Rent & Bills screen, showing invoices, balances, due dates, history, and a bank-transfer submission form.
4. Add an admin Estate screen to manage units, tenancies, invoices, announcements, and review pending payments using `estate_confirm_payment`.
5. Use the existing Supabase authenticated client and row-level security; never expose a service-role key in frontend code.
6. Verify monthly, yearly, partial, rejected, and overpayment cases with authenticated test users.
7. Deploy to Vercel preview first, validate existing functionality, then release to production.

## Current status
The backend RPC update was deployed to Supabase. The frontend changes have **not** been deployed to the production website.
