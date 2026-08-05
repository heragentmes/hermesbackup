---
name: brand-research
description: "Research a brand or company online presence."
tags: [research, brand, company, web, social-media, domain]
---

# Brand & Company Research

Systematic methodology for investigating a brand or company's online presence, digital footprint, and public information.

## Trigger

Use this skill when the user asks to:
- Research a brand, company, or organization
- Find a company's website, social media, products, or services
- Investigate a brand's online presence or digital footprint
- Look up information about a business (especially foreign/regional)

## Methodology

### Phase 1: Parallel Discovery (run simultaneously)

Launch these checks in parallel to maximize coverage. **IMPORTANT**: Do NOT prioritize search engines first — they almost always block automated requests from servers. Start with direct platform/registry checks, and treat search engines as a bonus if they work.

1. **Domain sweep** — Check likely domain patterns:
   - `<brand>.ir`, `<brand>.com`, `<brand>.co`, `<brand>.net`
   - `<brand>group.com`, `<brand>co.ir`
   - Transliterated variations (e.g., `rockcity` for راک سیت)
   - Parent company domains
   - Use `curl -sI` for HTTP status, then fetch content if 200

2. **Social media** — Check platform handles:
   - Instagram: `https://www.instagram.com/<handle>/` (check meta tags)
   - **Instagram post URL inspection** (powerful OSINT technique): If you find a post URL mentioning the company (e.g., from search results), fetch the post URL directly — the HTML `<meta>` tags (`og:description`, `og:title`, `og:url`) contain the full caption text, author handle, like count, and date, even without login. Example: `curl -sL 'https://www.instagram.com/p/POSTID/' | python3 -c "import sys,re,html; t=sys.stdin.read(); m=re.findall(r'content=\"([^\"]*)\"', t); [print(html.unescape(x)) for x in m if len(x)>50]"`
   - Telegram: `https://t.me/s/<handle>` (check title, description, message count)
   - LinkedIn, Twitter/X, Facebook
   - Platform-specific: Eitaa, Bale, Rubika (Iranian platforms)

3. **Business registries** — Check regional databases:
   - Iran: asnaf.ir, ghadee.ir, ilenc.ir
   - General: OpenCorporates, LinkedIn company pages
   - **Iranian job/professional platforms** (excellent for company profiles):
     - **Karboom** (karboom.io/companies/<name>): Company size, industry, description, job postings
     - **Civilica** (civilica.com): Academic/researcher profiles — search by founder name to find their affiliation, publications, and scientific committee memberships. Reveals founder identities when other sources don't.
     - **amtehran.ir**: Tehran Mass Housing Builders Association — lists member construction companies
     - **Kargosha** (profile.kargosha.com): Company profiles for road/construction sector

4. **Search engines** — Query multiple engines with:
   - Brand name in original language (e.g., Persian/Arabic script)
   - Brand name in English/Latin script
   - Brand name + parent company name
   - Brand name + industry keywords
   - Try: Google, Bing, DuckDuckGo, Yandex
   - **NOTE**: From a server, virtually ALL search engines will block with CAPTCHAs. Do not spend more than 2-3 attempts. If the first engine blocks, skip the rest and move on.

### Phase 2: Deep Inspection

For each hit from Phase 1:

1. **Domain content analysis**:
   - Check if domain is active, parked, or for sale
   - Look for: "for sale", "parked", "MyDomain", GoDaddy parking pages
   - Extract meta tags, descriptions, contact info
   - Check SSL certificate (subject/SANs) for domain mismatches

2. **Social media content analysis**:
   - Telegram: Check message count, post history, description
   - Instagram: Check bio, follower count, post count
   - Look for verified accounts vs. impersonators

3. **Cross-reference validation**:
   - Does the website match the claimed parent company?
   - Are social media accounts linked to the same entity?
   - Check for similar-named companies that might cause confusion
   - **Founder/key person cross-referencing**: If you find a founder name (e.g., from Instagram posts or news), search for them on:
     - Civilica (civilica.com) — academic profiles with company affiliation and publication count
     - LinkedIn — professional background
     - Instagram — personal or professional posts about the company
     - This often reveals the company's founding date, academic connections, and industry standing

### Phase 3: Synthesis

Compile findings into structured summary:
- **Website**: URL, status, content summary
- **Social media**: Platforms, handles, activity level
- **Products/Services**: What the company offers
- **Parent company**: Relationship, other brands
- **Confidence level**: How certain are we about the findings

## Pitfalls

### Search Engine Blocking
- Google, Bing, DuckDuckGo, Yandex all block automated curl requests with CAPTCHAs
### Workarounds
- **Yahoo search** often works when Google/DDG/Bing block — use it as the primary fallback: `curl -sL 'https://search.yahoo.com/search?p=QUERY' -H 'User-Agent: Mozilla/5.0'`
- **Bing**: sometimes returns results but often buried in JS; try with realistic User-Agent
- Do not waste time retrying blocked engines — move to other research methods (direct domain checks, social media, business registries)
- **Instagram meta-tag extraction** is highly reliable (see Phase 1, step 3 below)

### Domain Parking and For-Sale Detection
- Many domains show HTTP 200 but are actually parked/for-sale
- **Red flags**: "MyDomain" branding, GoDaddy parking, "domain for sale" text
- **Verification**: Check page content, not just HTTP status code
- SSL certificate mismatches (CN does not match hostname) indicate shared/parked hosting

### Similarly-Named Companies
- Common names (e.g., "Artin") may have multiple unrelated companies
- **Always verify**: Does the website/description match the claimed parent company?
- Check company description, industry, location for consistency
- Example: "Artinco" (furniture) is NOT the same as "Artin" (construction) despite similar names

### LinkedIn and Professional Networks
- LinkedIn company search and people search require authentication — unauthenticated requests return login redirects with no useful data
- LinkedIn public profiles (if you know the URL) sometimes work but the search results page does not
- **Do not waste time on LinkedIn searches** — focus on social platforms, domains, and registries instead

### Iranian Internet Ecosystem
- **Telegram** is the primary social/business platform in Iran
- **Instagram** is popular but content extraction is harder
- **.ir domains** require Iranian presence; many are parked/for-sale
- **Local platforms**: Eitaa, Bale, Rubika (Iranian alternatives to WhatsApp/Telegram)
- Business registries: asnaf.ir (guilds), ilenc.ir (company registry)
- **CRITICAL: Iranian business registries are often inaccessible from outside Iran** — DNS resolution failures (cima.ir), 403s (samandehi.ir, iripo.ir), connection refused (samaneh.ir), or timeouts (enamad.ir, codal.ir) are common. Do not waste multiple attempts on these — if one fails, note it and move on.
- **TSETMC** (Tehran Stock Exchange) API times out for non-ASCII queries from outside Iran

### Language and Script Challenges
- Brand names may appear in Persian/Arabic script, English, or transliterated
- Search in BOTH scripts to maximize coverage
- Example: راک سیت = Rock City = rockcity
- Some search engines handle Farsi better than others

## Tools and Commands

### Domain Status Check
```bash
# Quick HTTP status
curl -sI -o /dev/null -w "%{http_code}" "https://example.com" -m 5

# Full headers
curl -sI "https://example.com" -H "User-Agent: Mozilla/5.0"

# SSL certificate info
curl -svI "https://example.com" 2>&1 | grep -E "subject:|CN=|DNS:"
```

### Content Extraction

**Basic (sed) — works for simple pages:**
```bash
curl -sL "https://example.com" | sed 's/<[^>]*>//g' | tr -s ' \n' '\n'
```

**Enhanced (Python) — use when sed returns too much CSS/JS noise:**
```bash
curl -sL "https://example.com" -H "User-Agent: Mozilla/5.0" 2>/dev/null | python3 -c "
import sys, re
html = sys.stdin.read()
html = re.sub(r'<script[^>]*>.*?</script>', '', html, flags=re.DOTALL)
html = re.sub(r'<style[^>]*>.*?</style>', '', html, flags=re.DOTALL)
text = re.sub(r'<[^>]+>', '\n', html)
lines = [l.strip() for l in text.split('\n') if l.strip() and len(l.strip()) > 3]
seen = set()
result = []
for l in lines:
    if l not in seen and not l.startswith('{') and not l.startswith('var '):
        seen.add(l)
        result.append(l)
for l in result[:100]:
    print(l)
"
```
This pattern strips `<script>` and `<style>` blocks first, then removes tags, filters short lines, and deduplicates. Works well for Laravel/PHP sites with heavy CSS.

**Extract meta tags and links:**
```bash
curl -sL "https://example.com" | grep -oP 'meta [^>]+|<title>[^<]+'
curl -sL "https://example.com" | grep -oP 'href="[^"]+' | head -20
```

### Telegram Channel Check
```bash
# Check if channel exists and get info
curl -sL "https://t.me/s/<channel>" | grep -oP '<title>[^<]+|"og:description" content="[^"]*"'
```

### Instagram Handle Check
```bash
# Check handle existence (returns meta info)
curl -sL "https://www.instagram.com/<handle>/" -H "User-Agent: Mozilla/5.0" | grep -oP '"description":"[^"]*"'
```

## Phase 4: Marketing Proposal Generation

After research is complete, the user often wants a structured digital marketing proposal. This is a natural extension of brand research.

### Two Levels of Proposals

**Level 1: Standard (10 pages)** — When the user just wants to win the project
**Level 2: Consulting (18-22 pages)** — When the user wants to become a media consultant (McKinsey/Deloitte style)

⚠️ **IMPORTANT**: Most users who ask for a proposal actually need Level 2. A basic proposal signals "social media manager"; a consulting-level proposal signals "media consultant". Always ask or default to Level 2.

### Level 2: Consulting-Level Proposal Structure (Recommended)

When the user wants a proposal that positions them as a media consultant (not just someone who does Instagram), use this structure. See `references/consulting-level-proposal.md` for the full template.

**Key sections:**
1. Cover page (professional, with confidentiality marking)
2. Executive Summary (1 page — "Why this project?")
3. Current State Analysis (table format)
4. Core Problem statement (integrated media system, not "website is broken")
5. Data mining & analysis as expertise differentiator
6. 3 strategic objectives
7. Media Ecosystem Architecture (diagram)
8. 3 phases with weekly breakdown (tables)
9. Final Deliverables (numbered table)
10. KPIs (tied to deliverables, not just follower counts)
11. Execution method (6-step cycle)
12. Roles & Responsibilities (2-column)
13. Project Risks
14. Client Prerequisites
15. Conclusion (forward-looking)

**What makes it consulting-level:**
- Data mining mentioned as media expertise
- Risk assessment included
- Weekly breakdown shows operational thinking
- KPIs are controllable outcomes, not vanity metrics
- Forward-looking (6-month development plan)
- Roles clearly defined (consultant vs client)

### Level 1: Standard Proposal Structure (3-month, 7 suggestions)

1. **Brand Identity & Website** — visual consistency, fix broken pages, add CTAs
2. **LinkedIn Company Page** — if missing, create it; connect CEO's personal profile
3. **Content Calendar** — weekly schedule across platforms (post types per day)
4. **Content Production** — articles, infographics, videos, behind-the-scenes
5. **Platform Activation** — Telegram, Instagram, LinkedIn-specific strategies
6. **New Channel Launch** — if brand has pre-launch channels, activate them
7. **Trust-Building Campaigns** — webinars, live Q&As, customer testimonials, contests

### Proposal Sections
- Executive summary (current state analysis)
- Strengths, weaknesses, opportunities, threats
- 7 numbered suggestions with timeline
- Month-by-month phasing table (Month 1: infrastructure, Month 2: production, Month 3: engagement)
- KPIs with targets (followers, engagement rate, traffic, leads)
- Estimated costs breakdown
- Immediate action items (week 1)

### Output Format
- Use Farsi if the user communicates in Farsi
- Use tables for comparisons and timelines
- Use emoji sparingly for section headers
- Keep it professional but readable — the user (often a CEO) will review it

### Data Mining as a Differentiator
When writing proposals, mention data mining and data-driven analysis as a media expertise. This separates you from basic social media managers:
- Audience behavior analysis (engagement patterns, peak hours)
- Content performance analysis (which posts work and why)
- SEO and traffic analysis (keywords, bounce rate)
- Competitor analysis (content frequency, engagement, positioning)
- Trend forecasting (seasonal opportunities)
- Mention this in the "Core Problem" section of consulting-level proposals

### Proposal Level Mismatch
If you send a basic 10-page proposal when the user wants consulting-level work, they'll see you as a social media manager, not a consultant. When in doubt, go with Level 2 (consulting-level).

### Content Must Sound Human-Written
The user will reject AI-generated content immediately. Use CEO's voice, real experiences, conversational tone. See content-strategy-learnings.md for examples.

### Content Segmentation
Never publish the same content everywhere. Each platform has its own audience and tone. See content-strategy-learnings.md for the routing matrix.

| Platform | Content Type | Audience | Tone |
|----------|-------------|----------|------|
| Instagram | Visual, simple, engaging | General public, small investors | Friendly, casual |
| Telegram | Analytical, exclusive news | Active followers, professionals | Expert, opinionated |
| LinkedIn | Specialized, thought leadership | Executives, large investors, B2B | Professional, formal |
| Website | Comprehensive, official, SEO | Everyone | Official, complete |

**Content categories must be routed correctly:**
- General/introductory content → Instagram + Telegram
- Analytical/opinion pieces → Telegram + LinkedIn
- Technical/specialized articles → LinkedIn + Website
- Sales/investment opportunities → Website + Telegram

**Human tone is mandatory — content MUST look like a human wrote it:**
- Use the CEO's own voice and personal opinions
- Share real experiences from projects ("دیروز رفتیم سر پروژه...")
- Ask questions, create polls, encourage engagement
- Avoid generic AI phrases (see humanizer skill for patterns to avoid)
- Good: "ما تو راکسیت یه تیم ۱۵ نفره‌ایم که عاشق ساختمون ساختنیم"
- Bad: "شرکت ما با بهره‌گیری از تکنولوژی‌های نوین..."

**LinkedIn company page is a priority when missing:**
- If only the CEO has a personal LinkedIn page, the COMPANY page must be created first
- Connect the CEO's profile to the company page
- This is often the most overlooked step in brand setup

### Pitfalls
- **Don't assume the user wants English output** — match their language
- **Don't skip the cost section** — executives need budget estimates
- **Don't propose actions without KPIs** — every suggestion needs measurable targets
- **CEO time is limited** — the proposal should be scannable, not a novel
- **Don't create generic content** — each platform has its own audience and tone
- **Don't skip LinkedIn company page** — it's often the first thing that needs to be created
- **Don't make content sound like AI wrote it** — the user will reject it immediately

## Pitfalls (Additional)

### Instagram Unicode Decoding
- Persian/Arabic text from Instagram meta-tags comes as Unicode escapes: `\u0627\u0631\u062a\u06cc\u0646`
- Decode with: `bytes(text, 'utf-8').decode('unicode_escape')` or `print(text.encode().decode('unicode_escape'))`
- Or use Python: `'\u0627\u0631\u062a\u06cc\u0646'` → `آرتین`

### Telegram /s/ Endpoint
- `https://t.me/s/<channel>` returns public preview of channel messages
- Extract message text with regex on `tgme_widget_message_text` divs
- This is the most reliable way to read Telegram channel content from a server

## References

See `references/iranian-internet.md` for detailed notes on the Iranian internet ecosystem, business registries, and social media landscape.
See `references/takam-imran-artin-research.md` for a full research log documenting what was attempted and what failed for an Iranian construction company with minimal online presence.
