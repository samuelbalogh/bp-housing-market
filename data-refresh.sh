#!/bin/bash

# Budapest Housing Market Analysis - Data Refresh Script
# This script helps automate the data refresh process

echo "🏠 Budapest Housing Market Analysis - Data Refresh"
echo "=================================================="
echo ""

# Create timestamp for backup
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Create backup of current files
echo "📦 Creating backups..."
cp charts.js "charts.js.backup.$TIMESTAMP"
cp budapest-housing-analysis.md "budapest-housing-analysis.md.backup.$TIMESTAMP"
echo "✅ Backups created with timestamp: $TIMESTAMP"
echo ""

# Display current data status
echo "📊 Current Data Status:"
echo "----------------------"
echo "📈 Budapest Housing Data: $(grep -o '\[.*\]' charts.js | head -1 | wc -c) characters"
echo "📈 S&P 500 Data: $(grep -o '\[.*\]' charts.js | sed -n '2p' | wc -c) characters"
echo "📈 Inflation Data: $(grep -o '\[.*\]' charts.js | sed -n '3p' | wc -c) characters"
echo ""

# Display data sources
echo "🔗 Data Sources to Check:"
echo "------------------------"
echo "🏠 Housing Prices: https://www.ksh.hu/s/en/publications/housing-prices-housing-price-index/"
echo "🏦 House Price Index: https://www.mnb.hu/en/statistics/statistical-data-and-information/statistical-time-series/vi/real-estate-market-indicators"
echo "📈 S&P 500: https://finance.yahoo.com/quote/%5EGSPC/history"
echo "💰 Inflation: https://data.worldbank.org/indicator/FP.CPI.TOTL.ZG?locations=HU"
echo ""

# Check if files exist
echo "📁 File Status:"
echo "---------------"
if [ -f "charts.js" ]; then
    echo "✅ charts.js exists"
else
    echo "❌ charts.js missing"
fi

if [ -f "budapest-housing-analysis.md" ]; then
    echo "✅ budapest-housing-analysis.md exists"
else
    echo "❌ budapest-housing-analysis.md missing"
fi

if [ -f "index.html" ]; then
    echo "✅ index.html exists"
else
    echo "❌ index.html missing"
fi

echo ""

# Display next steps
echo "🔄 Next Steps:"
echo "--------------"
echo "1. 📊 Update data in charts.js:"
echo "   - Line 6: Budapest housing data"
echo "   - Line 10: S&P 500 data"
echo "   - Line 14: Inflation data"
echo ""
echo "2. 📝 Update analysis in budapest-housing-analysis.md:"
echo "   - Current statistics"
echo "   - Market trends"
echo "   - Conclusions"
echo ""
echo "3. 🧪 Test the updated analysis:"
echo "   python3 -m http.server 8000"
echo "   Then visit: http://localhost:8000"
echo ""
echo "4. ✅ Validate data quality:"
echo "   - Cross-reference multiple sources"
echo "   - Check for data revisions"
echo "   - Verify calculations"
echo ""

# Check for common issues
echo "🔍 Quick Validation:"
echo "-------------------"

# Check if charts.js has valid JavaScript syntax
if command -v node &> /dev/null; then
    if node -c charts.js 2>/dev/null; then
        echo "✅ charts.js has valid JavaScript syntax"
    else
        echo "❌ charts.js has JavaScript syntax errors"
    fi
else
    echo "⚠️  Node.js not available - cannot validate JavaScript syntax"
fi

# Check file sizes
echo "📏 File sizes:"
echo "   charts.js: $(wc -c < charts.js) bytes"
echo "   budapest-housing-analysis.md: $(wc -c < budapest-housing-analysis.md) bytes"
echo "   index.html: $(wc -c < index.html) bytes"

echo ""
echo "📅 Last backup: $TIMESTAMP"
echo "🔄 Next recommended update: $(date -d "+3 months" +%Y-%m-%d)"
echo ""
echo "💡 Tip: Run this script before each data update to create backups!"
