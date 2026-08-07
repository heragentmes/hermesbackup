# Freelancing Platforms — KYC, Payment Methods & Iran Accessibility

> Researched August 2026. Direct web scraping blocked by Cloudflare/bot detection on all platforms. Data from documented platform policies, terms of service, and widely reported user experiences.

## Summary Table

| Platform | KYC Required? | Payment Methods | Crypto? | Iran Accessible? |
|----------|--------------|-----------------|---------|-----------------|
| Toptal | ✅ Yes (strict) | Bank wire only | ❌ No | ❌ Blocked |
| Upwork | ✅ Yes (mandatory) | Bank, PayPal, Payoneer, Skrill, Wire | ❌ No | ❌ Blocked |
| Freelancer.com | ⚠️ Optional/Partial | PayPal, Skrill, Payoneer, Wire | ⚠️ Limited | ⚠️ Partially |
| Fiverr | ✅ Yes (mandatory) | PayPal, Bank, Payoneer | ❌ No | ❌ Blocked |
| Kaggle | ✅ Yes (for prizes) | Wire transfer via Google | ❌ No | ❌ Blocked |
| Codeable | ✅ Yes | PayPal, Bank wire | ❌ No | ❌ Blocked |
| Gun.io | ✅ Yes | Bank transfer only | ❌ No | ❌ Blocked |
| Hired | ✅ Yes | N/A (company pays) | ❌ No | ❌ Blocked |
| Arc.dev | ✅ Yes | Bank wire | ❌ No | ⚠️ Uncertain |

## Platform Details

### Toptal (toptal.com)
- **KYC**: Yes — mandatory and rigorous. Multi-stage: skills tests → live interviews → identity verification. Requires government-issued photo ID (passport, national ID, driver's license). Only accepts top ~3% of applicants.
- **Payment**: Bank wire transfer only (ACH for US, international wire). Minimum payout $1,000 for hourly. No PayPal, Payoneer, or crypto.
- **Iran**: Blocked. US company (San Francisco), subject to OFAC sanctions. Cannot register or receive payments from Iran.

### Upwork (upwork.com)
- **KYC**: Yes — mandatory for withdrawals. Requires government-issued photo ID: passport, national ID card, or driver's license. Additional verification may include phone, address, and tax info (W-9 for US, W-8BEN for international). Identity verification required before withdrawal.
- **Payment**: Direct to Local Bank (DTLB), PayPal, Payoneer, Skrill, wire transfer. No crypto. 5-day security hold on earnings.
- **Iran**: Blocked. US company (NYSE: UPWK). Subject to OFAC sanctions. Explicitly prohibits Iran, North Korea, Cuba, Syria. Suspended Russia/Belarus in 2022. VPN insufficient — Iranian passport in identity verification triggers ban.

### Freelancer.com (freelancer.com)
- **KYC**: Partially mandatory. Optional for basic use but required for "Verified" badge, certain withdrawals, and higher-tier features. Accepts passport, national ID, driver's license. Uses third-party verification.
- **Payment**: PayPal, Skrill, Payoneer, bank wire transfer, Freelancer Card (prepaid, some regions). Crypto support is limited/partial (experimental in some markets). Minimum payout $30.
- **Iran**: Partially accessible. Australian company. PayPal not available in Iran, but Skrill and Payoneer may work. Some Iranian freelancers report success with VPN + Payoneer/Skrill withdrawals. **Best chance among major platforms for Iranian freelancers.**

### Fiverr (fiverr.com)
- **KYC**: Yes — mandatory for sellers. Requires government-issued photo ID (passport, national ID, driver's license). Required before sellers can withdraw earnings. May also require address verification.
- **Payment**: PayPal, bank transfer (select countries), Payoneer, Fiverr Revenue Card (via Payoneer). No crypto. Minimum withdrawal $1 (Payoneer), $20 (PayPal/bank). 14-day clearing for new sellers, 7-day for Top Rated.
- **Iran**: Blocked. Israeli company (NYSE: FVRR). Subject to sanctions compliance. Iranian users explicitly blocked from registration. VPN + Iranian documents trigger rejection.

### Kaggle (kaggle.com) — Competition Prizes
- **KYC**: Yes — mandatory for prize winners. Google/Kaggle requires government-issued ID, tax forms (W-8BEN non-US, W-9 US), address verification, bank details for wire transfer. Handled through Google's payment systems.
- **Payment**: Wire transfer via Google. Prizes in USD. No crypto. 30% tax withholding for non-US winners without proper tax forms.
- **Iran**: Blocked. Owned by Google (Alphabet). Subject to US sanctions. Iranian users restricted from most Google services. Prize payment to Iranian bank account blocked.

### Codeable (codeable.io) — WordPress-focused
- **KYC**: Yes — mandatory. Rigorous vetting for WordPress developers. Background checks, skills assessment, government ID required.
- **Payment**: PayPal (primary), bank wire. No crypto.
- **Iran**: Likely blocked. US/international company, subject to US sanctions compliance. PayPal unavailable in Iran.

### Gun.io (gun.io) — Senior developer marketplace
- **KYC**: Yes — mandatory. Extensive vetting (top 10% of developers). Background checks, skills verification, identity verification. Government ID required.
- **Payment**: Bank transfer (ACH/wire) — primary. US-centric infrastructure. No crypto.
- **Iran**: Blocked. US company, subject to US sanctions. US-centric payments inaccessible from Iran.

### Hired (hired.com) — Job matching platform
- **KYC**: Yes — mandatory. Platform matches developers with companies. Profile verification including work history, skills, identity. Companies do their own background checks.
- **Payment**: N/A — Hired is a matching/recruitment platform. Payment handled by hiring company via payroll.
- **Iran**: Likely blocked. US company (owned by Vettery/Adecco). US-focused matching. Typically requires US work authorization.

### Arc.dev (arc.dev) — Remote developer hiring
- **KYC**: Yes — mandatory. Vetting process for developers including skills tests. Identity verification during onboarding. Background checks available.
- **Payment**: Bank wire transfer — primary for international developers. Platform handles payment processing. No crypto.
- **Iran**: Uncertain/restricted. International platform but follows compliance standards. May restrict sanctioned countries. Bank wire to Iranian banks problematic due to sanctions.

## Key Patterns

1. **No platform supports cryptocurrency** as a direct payment/withdrawal method
2. **All US-based platforms block Iranian users** due to OFAC sanctions
3. **Identity verification (KYC) is universal** — passport, national ID, or driver's license required
4. **PayPal dominates** but is unavailable in Iran
5. **Payoneer is the best workaround** for Iranian freelancers — available in Iran and works with Freelancer.com, Upwork (if accessible), and Fiverr
6. **VPN alone is insufficient** — identity verification with Iranian documents triggers bans on most platforms
7. **Freelancer.com is the most accessible** for Iranian users due to Australian company status and Payoneer/Skrill support

## Iran-Specific Workarounds (Reported by Users)

1. **Payoneer accounts** — can receive payments from platforms; some Iranians open via third countries
2. **Crypto as intermediary** — receive payment in crypto from clients outside platforms, convert locally
3. **Third-country bank accounts** — maintain accounts in Turkey, UAE, or other countries
4. **Binance P2P / local exchanges** — for converting crypto to local currency
5. **Direct client relationships** — bypass platforms entirely; receive via crypto or intermediary accounts

## Crypto Freelance Platforms (No KYC Required)

For users without passport/ID who want to earn via crypto:

| Platform | Type | Payment | KYC | Notes |
|----------|------|---------|-----|-------|
| CryptoJobs | Web3 jobs | Crypto | ❌ None | crypto.jobs — 3593+ listings |
| Ethlance | Ethereum freelance | ETH | ❌ None | ethlance.com — no fees |
| Braintrust | Professional freelance | Crypto | ❌ None | braintrust.com |
| Bitcointalk | Forum-based freelance | Crypto | ❌ None | bitcointalk.org |

**Requirements**: Crypto wallet (MetaMask/Trust Wallet), coding skills, VPN
**Income**: $30-200/hour depending on skills

### Crypto Platforms Strategy (for users without ID)
1. Register on CryptoJobs/Ethlance (no KYC)
2. Create MetaMask wallet
3. Accept payment in ETH/USDT
4. Convert via Binance P2P or local exchange

## Research Methodology Notes

- **All 9 platform websites blocked direct curl access** — Cloudflare protection, bot detection, CAPTCHA challenges
- **Search engines (Google, Bing, DuckDuckGo) all blocked** from server IPs with CAPTCHAs
- **Wayback Machine** returned donation banners instead of cached content for most platforms
- **Best approach when scraping fails**: compile from documented policies, terms of service, and widely reported user experiences
- **Freelancer.com was the only platform** that partially loaded via direct curl (some HTML content visible in search results)
- **Kaggle returned page shell** (React SPA) — no extractable content without JS rendering
