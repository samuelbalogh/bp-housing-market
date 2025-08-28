# Budapest Housing Market Analysis - Data Refresh Guide

## Quick Start

This guide provides step-by-step instructions for refreshing the data in your Budapest housing market analysis.

## 📊 Data Sources Overview

### Primary Sources (Update These First)

| Data Type | Source | URL | Frequency |
|-----------|--------|-----|-----------|
| **Housing Prices** | KSH (Hungarian Central Statistical Office) | https://www.ksh.hu/s/en/publications/housing-prices-housing-price-index/ | Quarterly |
| **House Price Index** | MNB (Hungarian National Bank) | https://www.mnb.hu/en/statistics/statistical-data-and-information/statistical-time-series/vi/real-estate-market-indicators | Monthly |
| **S&P 500** | Yahoo Finance | https://finance.yahoo.com/quote/%5EGSPC/history | Real-time |
| **Inflation** | World Bank | https://data.worldbank.org/indicator/FP.CPI.TOTL.ZG?locations=HU | Monthly |

## 🔄 Step-by-Step Refresh Process

### Step 1: Update Housing Market Data

#### 1.1 KSH Housing Price Index
1. Visit: https://www.ksh.hu/s/en/publications/housing-prices-housing-price-index/
2. Download the latest quarterly report (PDF or Excel)
3. Extract the Budapest housing price index values
4. Update `charts.js` line 6:
   ```javascript
   data: [85, 87, 89, 92, 95, 98, 100, 110, 125, 145, 165, 180, 200, 240, 273, 300]
   // Replace with new values
   ```

#### 1.2 MNB House Price Index
1. Visit: https://www.mnb.hu/en/statistics/statistical-data-and-information/statistical-time-series/vi/real-estate-market-indicators
2. Download the latest Excel file
3. Look for "House Price Index" series
4. Cross-reference with KSH data for consistency

### Step 2: Update S&P 500 Data

#### 2.1 Download Historical Data
1. Visit: https://finance.yahoo.com/quote/%5EGSPC/history
2. Set date range: 2009-01-01 to current date
3. Click "Download Data" (CSV format)
4. Open the CSV file in Excel/Google Sheets

#### 2.2 Calculate Cumulative Returns
1. Add a column for cumulative returns (starting with 100 in 2009)
2. For each year, multiply by (1 + annual_return/100)
3. Update `charts.js` line 10:
   ```javascript
   data: [100, 115.06, 117.49, 136.29, 180.48, 205.18, 207.99, 232.88, 283.69, 271.27, 356.85, 422.42, 543.67, 445.15, 562.15, 702.70]
   // Replace with new cumulative values
   ```

### Step 3: Update Inflation Data

#### 3.1 World Bank Inflation Data
1. Visit: https://data.worldbank.org/indicator/FP.CPI.TOTL.ZG?locations=HU
2. Download the data (CSV format)
3. Extract annual inflation rates for 2009-2024
4. Update `charts.js` line 14:
   ```javascript
   data: [4.2, 4.9, 3.9, 5.7, 1.7, -0.2, 0.1, 0.4, 2.4, 2.8, 3.4, 3.3, 5.1, 14.6, 17.1, 3.7]
   // Replace with new inflation rates
   ```

#### 3.2 Cross-reference with Trading Economics
1. Visit: https://tradingeconomics.com/hungary/inflation-cpi
2. Verify the latest inflation figures
3. Check for any data revisions

### Step 4: Update Analysis Text

#### 4.1 Update Key Statistics
In `budapest-housing-analysis.md`, update:
- Current housing price index values
- Latest inflation rates
- Recent market developments
- Updated conclusions

#### 4.2 Update Tables
- Annual returns table
- Market segmentation table
- Performance comparison table

### Step 5: Validate Data

#### 5.1 Cross-reference Sources
- Compare KSH and MNB housing data
- Verify S&P 500 calculations
- Check inflation data consistency

#### 5.2 Check for Revisions
- Official sources often revise historical data
- Update methodology notes if needed
- Document any changes in data collection

## 🛠️ Automated Refresh Script

Create a simple script to help with data updates:

```bash
#!/bin/bash
# data-refresh.sh

echo "Budapest Housing Market Analysis - Data Refresh"
echo "==============================================="

# Create backup
cp charts.js charts.js.backup.$(date +%Y%m%d)

echo "1. Please update the following files:"
echo "   - charts.js (data arrays)"
echo "   - budapest-housing-analysis.md (analysis text)"
echo ""
echo "2. Test the updated analysis:"
echo "   python3 -m http.server 8000"
echo "   Then visit: http://localhost:8000"
echo ""
echo "3. Backup created: charts.js.backup.$(date +%Y%m%d)"
```

## 📅 Recommended Refresh Schedule

### Monthly Updates
- **Inflation data**: Check World Bank and Trading Economics
- **S&P 500**: Download latest data from Yahoo Finance
- **Market news**: Monitor for major policy changes

### Quarterly Updates
- **Housing indices**: KSH and MNB reports
- **Market analysis**: Update trends and forecasts
- **Performance comparison**: Recalculate returns

### Annual Updates
- **Comprehensive review**: Full analysis refresh
- **Methodology check**: Verify data collection methods
- **Source validation**: Ensure all sources are still reliable

## 🔍 Data Quality Checklist

Before publishing updated analysis:

- [ ] All data sources are current and reliable
- [ ] Calculations are verified and accurate
- [ ] Cross-referenced with multiple sources
- [ ] Methodology notes are updated
- [ ] Charts render correctly with new data
- [ ] Analysis text reflects current market conditions
- [ ] Backup of previous version is created

## 📞 Contact Information

### Official Data Sources
- **KSH**: info@ksh.hu
- **MNB**: info@mnb.hu
- **World Bank**: data@worldbank.org

### Technical Support
- **Chart.js Documentation**: https://www.chartjs.org/docs/
- **GitHub Issues**: For code-related problems

## 🚨 Important Notes

### Data Delays
- **Housing data**: 2-3 month reporting delay
- **Inflation data**: Subject to revision for up to 12 months
- **S&P 500**: Real-time but dividends may be delayed

### Currency Considerations
- Use official MNB exchange rates for HUF conversions
- Consider currency risk in analysis
- Document exchange rates used

### Methodology Changes
- Official sources may change calculation methods
- Document any methodology changes
- Update analysis accordingly

## 📈 Example Data Update

Here's an example of how to update the data arrays:

```javascript
// Before (old data)
chartData.budapestHousing.data = [85, 87, 89, 92, 95, 98, 100, 110, 125, 145, 165, 180, 200, 240, 273, 300];

// After (new data)
chartData.budapestHousing.data = [85, 87, 89, 92, 95, 98, 100, 110, 125, 145, 165, 180, 200, 240, 273, 300, 315];
//                                                                                                    ^^^^ new value
```

## 🎯 Quick Commands

```bash
# Start local server to test updates
python3 -m http.server 8000

# Create backup before updates
cp charts.js charts.js.backup.$(date +%Y%m%d)

# Check file sizes (should increase with new data)
ls -la *.js *.md

# Validate JSON syntax
node -c charts.js
```

---

**Last Updated**: August 2024  
**Next Review**: November 2024 (Quarterly)  
**Data Current As**: Q2 2024
