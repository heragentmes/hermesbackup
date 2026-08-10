# Telegram Channel Content Analysis

## Methodology

### Data Extraction (t.me/s/ endpoint)

Telegram's public preview at `https://t.me/s/<channel>` returns the most recent ~20 posts. This is the primary data source for channel analysis.

#### Extracting Posts
```bash
# Get HTML
curl -sL "https://t.me/s/<channel>" -H "User-Agent: Mozilla/5.0" > /tmp/channel.html

# Extract dates
grep -oP 'datetime="[^"]*"' /tmp/channel.html

# Extract views
grep -oP 'tgme_widget_message_views">[^<]*' /tmp/channel.html

# Extract text (requires Python for proper parsing)
python3 -c "
import re
html = open('/tmp/channel.html').read()
texts = re.findall(r'<div class=\"tgme_widget_message_text[^\"]*\"[^>]*>(.*?)</div>', html, re.DOTALL)
for t in texts:
    clean = re.sub(r'<[^>]*>', '', t).strip()[:100]
    print(clean)
"
```

### Content Categorization

Categorize each post into one of these buckets:

| Category | Keywords (Persian) | Keywords (English) |
|----------|-------------------|-------------------|
| **سیاسی** | مجلس, وزیر, دولت, رئیس‌جمهور, انتخابات, تحریم | parliament, minister, government, election, sanctions |
| **اقتصادی** | بورس, ارز, طلا, مسکن, تورم, بانک | stock, currency, gold, housing, inflation, bank |
| **اجتماعی** | مردم, فرهنگ, ورزش, سلامت, آموزش | people, culture, sports, health, education |
| **بین‌المللی** | آمریکا, اسرائیل, روسیه, چین, اوکراین | America, Israel, Russia, China, Ukraine |
| **تبلیغات** | تبلیغ, اسپانسر, همکاری تجاری | ad, sponsor, partnership |
| ** system** | ⚠️ Often starts with 🔻 or contains brand names | — |

### Posting Pattern Analysis

#### Metrics to Track
1. **Posts per day** — Total count
2. **Posts per hour** — Distribution across 24 hours
3. **Peak activity hours** — When most posts are published
4. **Content mix** — Percentage of each category per day
5. **Ad frequency** — How often ads appear (e.g., every N posts)
6. **View trajectory** — How views decay over time after posting

#### View Decay Pattern
Views typically follow this pattern:
- First hour: 60-80% of final views
- First 6 hours: 85-95% of final views
- After 24 hours: ~95% of final views
- Posts that get <5K views in first hour typically won't exceed 10K

### Ad Detection

**Signals that a post is an ad:**
- Starts with 🔻 (red down arrow) instead of ♦️ (blue diamond)
- Contains brand/company names not related to news
- Mentions phone numbers or contact info
- Contains promotional language ("خدمات", "مشاوره", "سرمایه‌گذاری")
- Posted at regular intervals (every N posts)

**Ad pricing estimation:**
- Based on channel's average views
- Typical CPM (cost per 1000 views) for Iranian Telegram: 50,000-200,000 IRR
- Premium channels can charge more

### Output Template

```markdown
# Channel Analysis: @<handle>

## Overview
- **Channel name:** 
- **Topic:** 
- **Posts analyzed:** 20 (most recent)
- **Date range:** 

## Posting Patterns
- **Average posts/day:** 
- **Peak hours:** 
- **Average interval:** 

## Content Breakdown
| Category | Count | Percentage |
|----------|-------|-----------|
| سیاسی | | |
| اقتصادی | | |
| اجتماعی | | |
| بین‌المللی | | |
| تبلیغات | | |

## View Analysis
- **Average views:** 
- **Highest viewed:** 
- **Lowest viewed:** 
- **View decay pattern:** 

## Ads
- **Number of ads:** 
- **Ad frequency:** Every N posts
- **Ad types:** 
- **Estimated CPM:** 

## Recommendations
- Best posting times
- Content gaps to exploit
- Ad placement opportunities
```

## Limitations

- **Only ~20 most recent posts** visible via t.me/s/ — cannot get historical data without Telegram API
- **Views may be delayed** — recent posts show lower views
- **Private channels** cannot be accessed via t.me/s/
- **Post text may be truncated** in the HTML — full text requires clicking through

## Cross-Platform Analysis

For a complete brand analysis, combine Telegram data with:
- **Instagram**: follower count, post frequency, engagement rate
- **Website**: traffic, SEO, content quality
- **LinkedIn**: company page presence, employee count
- **News mentions**: search engine results
