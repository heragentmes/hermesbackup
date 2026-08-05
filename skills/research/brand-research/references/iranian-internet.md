# Iranian Internet Ecosystem Notes

## Social Media Landscape

### Telegram (Primary Platform)
- **Status**: Most important business/social platform in Iran
- **Channel check**: `https://t.me/s/<channel>` returns public preview
- **Key indicators**:
  - Empty channels show "Contact @handle" title with no description
  - Active channels show message count, post history
  - No description = likely reserved but unused account
- **Common handles**: @brand_ir, @brandname, @brandname_ir

### Instagram
- Popular but harder to scrape (requires login for full data)
- **Handle check**: Returns meta tags even without login
- **Limitations**: "intern site in general" / "Meta.ai site" = generic/blocked response
- **Workaround**: Check bio, follower count via meta tags
- **Instagram post URL inspection** (powerful technique):
  - When you find a post URL (e.g., from search results), fetch it directly
  - The HTML `<meta>` tags contain rich data without login:
    - `og:description` = full caption text + like/comment count + date + author handle
    - `og:title` = display name | handle
    - `og:url` = canonical URL with handle
  - Example extraction: `curl -sL 'https://www.instagram.com/p/POSTID/' | python3 -c "import sys,re,html; t=sys.stdin.read(); [print(html.unescape(x)) for x in re.findall(r'content=\"([^\"]*)\"', t) if len(x)>50]"`
  - This reveals: company display name, Instagram handle, full post content, engagement metrics
  - **Discovery technique**: Search for posts mentioning the company name (e.g., on Yahoo), extract post URLs, then inspect each post's meta tags to find the company's own Instagram handle

### Iranian Platforms
- **Eitaa**: Iranian messaging app (alternative to Telegram)
- **Bale**: Iranian messaging app
- **Rubika**: Iranian messaging/social platform
- **Handles**: Same as Telegram (@handle)

## Domain Landscape

### .ir Domains
- Require Iranian presence to register
- Many are parked/for-sale through services like:
  - "MyDomain" (Iranian domain parking service)
  - GoDaddy (international)
- **Parking page indicators**:
  - Title: "خرید دامنه <domain> | این دامنه ممکن است برای فروش باشد"
  - Contact: 09009837483, @mydomain_ir
  - Multiple language options (FA, EN, IT, ES, AR, NL, DE, FR)

### Domain Status Patterns
- HTTP 200 ≠ active website (could be parking page)
- SSL cert CN mismatch = shared hosting/parked domain
- Empty response body = often parked or misconfigured

## Business Registries

### Iranian Registries
- **asnaf.ir**: Guild/trade association registry
- **ilenc.ir**: Company registry
- **ghadee.ir**: Another business directory

### Iranian Job/Professional Platforms (Excellent for Company Profiles)
- **Karboom** (karboom.io): Iranian job platform with detailed company profiles
  - URL pattern: `https://karboom.io/companies/<persian-company-name>/overview`
  - Returns: company size range, industry, description, job postings
  - Example: تحکیم عمران آرتین — "10 to 50 employees, Construction industry, EPC services"
- **Civilica** (civilica.com): Persian academic/researcher database
  - URL pattern: `https://civilica.com/p/<researcher-id>`
  - Search by person name to find: company affiliation, publication count, scientific committee memberships
  - Reveals founder identities when other sources don't
  - Example: Mehdi Zarghani — Researcher ID 183796, affiliated with شرکت تحکیم عمران آرتین, 6 conference papers, 3 journal papers
- **amtehran.ir**: Tehran Mass Housing Builders Association (انجمن صنفی انبوه سازان مسکن تهران)
  - Lists member construction companies for the National Housing Movement (نهضت ملی مسکن)
- **Kargosha** (profile.kargosha.com): Company profiles for road/construction sector
  - URL pattern: `https://profile.kargosha.com/<persian-category>/<company-name>`

### Key Companies Discovered
- **artinco.ir** (بهساز فراز گامان آرتین / ARTINCO):
  - Furniture/office decoration company
  - NOT the same as "شرکت تحکیم عمران آرتین" (construction)
  - Social: Facebook, LinkedIn, Instagram, Twitter, Telegram (@Artinco_channel)
  - WhatsApp: +989****6898

## Search Engine Access

### Blocking Patterns
- **Google**: 302 redirect → CAPTCHA
- **Bing**: Returns page but results often hidden in JS
- **DuckDuckGo**: "Unfortunately, bots use DuckDuckGo too" CAPTCHA
- **Yandex**: SmartCaptcha challenge

### Workarounds
- **Yahoo search** works when Google/DDG/Bing block — use as primary fallback: `curl -sL 'https://search.yahoo.com/search?p=QUERY' -H 'User-Agent: Mozilla/5.0'`
- Use realistic User-Agent headers for all engines
- Try Bing first (sometimes lenient), then Yahoo
- Fall back to direct HTTP checks for domains
- Use `execute_code` with Python requests for better session handling
- Check Telegram channels directly (no CAPTCHA)
- Check Instagram meta tags directly (no CAPTCHA)

## Language Considerations

### Script Variations
- Persian: راک سیت
- English: Rock City
- Transliterated: rockcity, rock-city, rock_city

### Search Strategy
- Always search in BOTH scripts
- Include transliterated versions
- Some engines handle Farsi better than others
