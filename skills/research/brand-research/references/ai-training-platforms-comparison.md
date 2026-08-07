# AI Training / Data Annotation Platforms — KYC & Payment Comparison

> Researched August 2026. Data from official websites, FAQ pages, help centers, and Wayback Machine archives.

## Summary Table

| Platform | KYC Required? | Payment Methods | Crypto? | Pay Frequency |
|---|---|---|---|---|
| Scale AI (Outlier + Remotasks) | ✅ Yes (valid ID + phone) | PayPal, AirTM | ❌ No | Weekly |
| DataAnnotation.tech | ✅ Yes (Persona) | PayPal only | ❌ No | Per project |
| Alignerr.com | ✅ Yes (Persona) | Stripe Connect or PayPal | ❌ No | Not specified |
| Mindrift (Toloka) | ⚠️ Conditional (specialized only) | Payoneer or Tipalti/PayPal | ❌ No | Bi-monthly |
| Stellar AI | ✅ Yes (contractor agreement) | PayPal only | ❌ No | Weekly |
| Hive Micro | ❌ Minimal (email only) | PayPal, **Bitcoin** | ✅ **YES** | On request (min $1) |
| TELUS Digital | ✅ Yes (ID + address) | Payoneer | ❌ No | Bi-weekly/Monthly |
| WeLocalize | ✅ Yes (SSN/national ID) | Payoneer, Direct Deposit (US) | ❌ No | Bi-weekly |
| RWS | ✅ Yes (ID verification) | PayPal, Bank Transfer | ❌ No | Varies |
| Invisible.co | ⚠️ Unclear (B2B-focused) | Not publicly disclosed | ❌ No | Not specified |
| OneForma.com | ⚠️ Not prominently required | Payoneer | ❌ No | Per project |

## Platform Details

### Scale AI (Outlier AI + Remotasks)
- **KYC**: **Yes — explicit identity verification required**. Outlier AI: Step 3 of 4-step onboarding is "Verify your identity". Requires "Valid ID and mobile phone from your country of residence." Remotasks: standard registration.
- **Payment**: **PayPal** or **AirTM** (worker's choice). Paid weekly. Outlier: competitive rates ($50-$100+/hr for specialists). Remotasks: micro-task rates, $15M+ paid total, 240K+ taskers, 90+ countries.
- **Crypto**: No direct. AirTM supports crypto conversion as a secondary feature, but Scale AI does not pay in crypto.
- **URLs**: https://outlier.ai (expert tasks), https://remotasks.com (micro-tasks), https://scale.com (enterprise)

### DataAnnotation.tech
- **KYC**: Uses **Persona** for identity verification (same vendor as Airbnb, Instacart, OpenAI). Requires **government-issued photo ID**: driver's license, passport, or national/state ID card. Must be valid and unexpired.
- **Payment**: **PayPal only** — explicitly stated in FAQ: "processes payments through PayPal". No signup fees, bank-level encryption. $20M+ paid to contractors since 2020.
- **Crypto**: No
- **URL**: https://dataannotation.tech

### Alignerr.com (powered by Labelbox)
- **KYC**: 5-step onboarding: Sign up → Apply → **Identity Verification** → Billing → Onboarding. Identity verification: phone number SMS first, then **government-issued ID via Persona**.
- **Payment**: **Stripe Connect** or **PayPal** depending on location. Up to $150/hr for specialists. Uses W-9/W-8BEN forms (US/international tax compliance).
- **Crypto**: No
- **URL**: https://alignerr.com

### Invisible.co (Meridial Expert Network)
- **KYC**: Unclear. Primarily B2B/enterprise platform. Meridial Expert Network is worker-facing but payment/KYC details not publicly accessible. "We continuously screen, test, and organize talent by skill, language, and domain expertise."
- **Payment**: Not publicly disclosed on website.
- **Crypto**: No
- **URL**: https://invisible.co

### Toloka.ai → Mindrift (worker tasks moved)
- **KYC**: **Conditional**. **All-access tasks**: Register → start earning immediately (no identity verification needed). **Specialized projects**: "Submit your CV and go through the traditional application process, including completing assessments and verifying your identity."
- **Payment**: **Payoneer** or **Tipalti (PayPal)** — user chooses withdrawal method. Payouts twice per month (5th and 20th). Dutch company (Toloka AI BV) based in Amsterdam, Schiphol Blvd 165.
- **Crypto**: No
- **URL**: https://toloka.ai (main) → https://mindrift.ai (worker-facing)
- **Note**: SOC 2 Type II, ISO 27001, ISO 27701 certified. 20K+ AI Trainers, 90+ domains, 20+ languages.

### Stellar AI (joinstellar.ai)
- **KYC**: Yes — workers must review and sign contractor agreements and set up payment information. PayPal account is explicitly required.
- **Payment**: **PayPal only**. Base rate $25/hr (may vary by project). Weekly payments.
- **Crypto**: No
- **URL**: https://joinstellar.ai
- **Note**: Open-ended contract work (independent contractor, not employment). Skill-match test required. Tasks include general AI agent creation, coding, research.

### Hive Micro (hivemicro.com)
- **KYC**: **Minimal** — email registration with basic account setup. No explicit passport/national ID requirement found. Verified PayPal account recommended for payment.
- **Payment**: **PayPal and Bitcoin** (confirmed by help.hivemicro.com: "At present, we support PayPal & Bitcoin only"). Bitcoin requires a verified PayPal first, then BTC address added in settings.
- **Crypto**: **✅ YES — Bitcoin is a supported payment method.** Minimum $1 payout for PayPal.
- **URL**: https://hivemicro.com
- **Note**: Micro-task platform for image labeling, categorization, bounding boxes, semantic segmentation, content moderation. Available globally. 1 Hive account = 1 Bitcoin address.

### TELUS Digital (telusdigital.com) — AI Community
- **KYC**: Yes — requires identity verification including ID document and address verification. Inherited strict KYC from Lionbridge AI (acquired 2020 for $935M).
- **Payment**: **Payoneer** is the primary payment method for AI Community workers.
- **Crypto**: No
- **URL**: https://www.telusdigital.com/ai-community
- **Note**: Rebranded from Telus International to Telus Digital in 2024. AI Community platform is JS-rendered and Cloudflare-protected — direct scraping very difficult. Also owns Lionbridge AI data annotation division.

### WeLocalize (welocalize.com / jobs.welocalize.com)
- **KYC**: Yes — requires SSN/tax identification for US workers, national ID for international workers. Standard employment verification applies.
- **Payment**: **Payoneer** (primary), direct deposit available for US-based workers.
- **Crypto**: No
- **URL**: https://www.welocalize.com (main), https://jobs.welocalize.com (worker portal — may redirect)
- **Note**: Also operates Gengo (gengo.com), a crowdsourced translation platform (acquired via Lionbridge). jobs.welocalize.com domain was DNS-unreachable during research.

### RWS (rws.com)
- **KYC**: Yes — workers must complete identity verification as part of onboarding. Enterprise-level annotation services require verified identities for compliance.
- **Payment**: **PayPal** and bank transfer (method varies by country and project type).
- **Crypto**: No
- **URL**: https://www.rws.com
- **Note**: Enterprise language services company (Gen AI training, annotation, validation, translation). Crowdsource worker platform is less publicly documented than competitors. Community forum at community.rws.com exists but has limited public payment info.

### OneForma.com (by Centific, formerly Pactera)
- **KYC**: Not prominently required on public pages. No resume/portfolio needed; 5-minute profile setup. Skill-matching system. May be project-specific.
- **Payment**: **Payoneer** — confirmed by user reviews ("received my pay on time through Payoneer"). Fee-free, no minimum thresholds, worldwide payouts in 100+ countries. $3.75M+ paid monthly to experts.
- **Crypto**: No
- **URL**: https://oneforma.com

## Key Patterns Observed

1. **Hive Micro is the only major platform supporting crypto (Bitcoin)** — all others use traditional payment processors only. AirTM (used by Scale AI/Remotasks) can convert to crypto as a secondary feature but is not a direct crypto payment.
2. **Persona is the dominant KYC vendor** — used by DataAnnotation and Alignerr
3. **PayPal ecosystem dominates** — either direct PayPal or via Tipalti/Stripe Connect
4. **Payoneer is the international alternative** — preferred by TELUS, WeLocalize, Mindrift, OneForma
5. **Identity verification is becoming standard** — most platforms require it, though enforcement varies (Mindrift has conditional KYC; Hive Micro has minimal KYC)
6. **Worker-facing sites may differ from main sites** — Toloka → Mindrift is the prime example; TELUS Digital's AI Community is a separate JS-rendered SPA
7. **AirTM is Scale AI's international payment choice** — used by both Outlier and Remotasks, supports crypto conversion but not a crypto-native payment
8. **KYC intensity correlates with pay rate** — higher-paying platforms (Outlier, Mindrift specialized) require stricter verification; micro-task platforms (Hive Micro, Remotasks basic) have lighter requirements

## Research Methodology Notes

- Sites built with Framer/Next.js return minimal text via `requests.get()` + BeautifulSoup
- FAQ pages are the most reliable source for payment/KYC details
- Search engines (Google, Bing, DuckDuckGo) often block or return empty from server IPs
- Reddit JSON API is blocked from server environments
- Trustpilot blocks automated requests with Cloudflare verification
- Best approach: fetch main site + FAQ/help pages directly, then keyword-search the text
- **Wayback Machine (web.archive.org)** is invaluable when live sites are JS-rendered or Cloudflare-protected — archived snapshots often have server-rendered HTML with full content. Try `https://web.archive.org/web/2024/https://example.com/faq` as a fallback.
- **Meta tags from main pages** often contain useful info even when full page content is JS-rendered — check `<meta name="keywords">` and `<meta name="description">` for payment/crypto mentions (e.g., Hive Micro's meta keywords include "bitcoin, paypal")
- **Multi-source triangulation**: When a platform's own site is inaccessible, check Wikipedia, archived versions, and third-party review sites for worker payment/KYC details
