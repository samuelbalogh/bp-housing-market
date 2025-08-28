# Budapest Housing Market Analysis: 2009-2024

A comprehensive analysis of the Budapest housing market performance over the past 15 years, comparing it with S&P 500 returns and considering inflation impacts.

## Files Overview

### 📄 `budapest-housing-analysis.md`
The main analysis document containing:
- Executive summary and key findings
- Historical performance data (2009-2024)
- Inflation impact analysis
- S&P 500 comparison
- Investment returns analysis
- Current market trends
- Future predictions
- Interactive chart placeholders
- **NEW**: Comprehensive data sources and refresh instructions

### 📊 `charts.js`
Interactive Chart.js visualizations including:
- **Performance Chart**: Budapest Housing vs S&P 500 comparison
- **Inflation Chart**: Hungary inflation rates over time
- **Comparison Chart**: Inflation-adjusted performance comparison
- Responsive design and interactive tooltips
- Clean, modular code with error handling
- **NEW**: Enhanced configuration for better rendering

### 🌐 `index.html`
Web interface that:
- Renders the markdown content with proper styling
- Displays interactive charts
- Provides responsive design for all devices
- Includes modern CSS styling and typography

### 📋 `README.md`
Complete documentation including:
- File descriptions and usage instructions
- Setup and running instructions
- **NEW**: Data refresh procedures and automation

### 🔄 `data-refresh-guide.md`
**NEW**: Comprehensive guide for updating data including:
- Step-by-step refresh process
- Data source URLs and contact information
- Recommended update schedule
- Data validation procedures
- Quality checklist

### 🛠️ `data-refresh.sh`
**NEW**: Automated refresh script that:
- Creates timestamped backups
- Validates file integrity
- Provides data source links
- Checks JavaScript syntax
- Guides through update process

## Quick Start

### 1. View the Analysis
```bash
# Start local server
python3 -m http.server 8000

# Open in browser
open http://localhost:8000
```

### 2. Update Data (When Needed)
```bash
# Run the refresh script
./data-refresh.sh

# Follow the guided process to update data sources
```

## Data Sources

### Primary Sources
- **Hungarian Central Statistical Office (KSH)**: Housing price indices
- **Hungarian National Bank (MNB)**: House price indices and economic data
- **Yahoo Finance**: S&P 500 historical data
- **World Bank**: Hungary inflation rates

### Secondary Sources
- **Global Property Guide**: International comparisons
- **Trading Economics**: Real-time economic data
- **S&P Global**: Official S&P 500 data

## Data Refresh Process

### Automated Refresh
```bash
# Run the automated refresh script
./data-refresh.sh
```

### Manual Refresh
1. **Update Housing Data**: Visit KSH and MNB websites
2. **Update S&P 500**: Download from Yahoo Finance
3. **Update Inflation**: Check World Bank data
4. **Modify Code**: Update arrays in `charts.js`
5. **Update Analysis**: Revise text in markdown file
6. **Test**: Verify charts render correctly

### Recommended Schedule
- **Monthly**: Check inflation and S&P 500 data
- **Quarterly**: Update housing market indices
- **Annually**: Comprehensive review and analysis

## Features

### 📈 Interactive Charts
- **Real-time rendering** with Chart.js
- **Responsive design** for all screen sizes
- **Interactive tooltips** with detailed data points
- **Color-coded data** for easy interpretation
- **Professional styling** with proper spacing

### 📊 Data Visualization
- **Performance comparison** between Budapest housing and S&P 500
- **Inflation analysis** with color-coded periods
- **Real returns calculation** accounting for inflation
- **Trend analysis** with smooth line charts

### 🔧 Technical Features
- **Clean code architecture** with modular functions
- **Error handling** and validation
- **Cross-browser compatibility**
- **Mobile-responsive design**
- **Fast loading** with optimized assets

## File Structure

```
finance/
├── budapest-housing-analysis.md    # Main analysis document
├── charts.js                       # Interactive chart code
├── index.html                      # Web interface
├── README.md                       # This documentation
├── data-refresh-guide.md           # Data update instructions
└── data-refresh.sh                 # Automated refresh script
```

## Technical Requirements

### Browser Support
- Chrome 60+
- Firefox 55+
- Safari 12+
- Edge 79+

### Dependencies
- Chart.js (loaded via CDN)
- Marked.js (loaded via CDN)
- Modern CSS features

### Local Development
- Python 3.x (for local server)
- Bash shell (for refresh script)
- Node.js (optional, for syntax validation)

## Troubleshooting

### Charts Not Displaying
1. Ensure you're using a local server (not file:// protocol)
2. Check browser console for JavaScript errors
3. Verify Chart.js is loading correctly
4. Check that canvas elements exist in HTML

### Data Update Issues
1. Run `./data-refresh.sh` to validate files
2. Check JavaScript syntax with `node -c charts.js`
3. Verify data array lengths match label arrays
4. Test with local server after updates

### Performance Issues
1. Clear browser cache
2. Check for large data arrays
3. Verify Chart.js version compatibility
4. Monitor browser console for errors

## Contributing

### Data Updates
1. Follow the data refresh guide
2. Create backups before making changes
3. Validate all data sources
4. Test thoroughly before publishing

### Code Improvements
1. Maintain clean code principles
2. Add error handling for new features
3. Test across different browsers
4. Update documentation accordingly

## License

This analysis is provided for educational and research purposes. Data sources are credited to their respective organizations.

## Contact

For technical issues or data questions:
- Check the data refresh guide for source contacts
- Review troubleshooting section for common issues
- Validate data using the automated script

---

**Last Updated**: August 2024  
**Data Current As**: Q2 2024  
**Next Review**: November 2024
