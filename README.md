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

### 📊 `charts.js`
Interactive Chart.js visualizations including:
- **Performance Chart**: Budapest Housing vs S&P 500 comparison
- **Inflation Chart**: Hungary inflation rates over time
- **Comparison Chart**: Inflation-adjusted performance comparison
- Responsive design and interactive tooltips
- Clean, modular code structure

### 🌐 `index.html`
Main HTML file that:
- Renders the markdown content
- Loads Chart.js and Marked.js libraries
- Provides responsive styling
- Creates an interactive web experience

## How to Use

### Option 1: Web Browser (Recommended)
1. Ensure all files are in the same directory
2. Open `index.html` in a modern web browser
3. The analysis will load with interactive charts

### Option 2: Local Server
For better performance, serve the files locally:
```bash
# Using Python 3
python -m http.server 8000

# Using Node.js (if you have http-server installed)
npx http-server

# Using PHP
php -S localhost:8000
```

Then visit `http://localhost:8000`

## Key Features

### Interactive Charts
- **Performance Comparison**: Visual comparison of Budapest housing vs S&P 500
- **Inflation Analysis**: Color-coded inflation rates with tooltips
- **Real Returns**: Inflation-adjusted performance comparison

### Responsive Design
- Mobile-friendly layout
- Adaptive chart sizing
- Clean, modern styling

### Data Sources
- Hungarian Central Statistical Office (KSH)
- Hungarian National Bank (MNB)
- S&P 500 Historical Data
- World Bank Inflation Data

## Technical Details

### Libraries Used
- **Chart.js**: Interactive charting library
- **Marked.js**: Markdown to HTML converter
- **Vanilla JavaScript**: No framework dependencies

### Browser Compatibility
- Modern browsers (Chrome, Firefox, Safari, Edge)
- Requires JavaScript enabled
- Responsive design for mobile devices

## Data Notes

### Budapest Housing Data
- Price index based on 2015 = 100
- Includes both new and second-hand properties
- Data from official Hungarian sources

### S&P 500 Data
- Total returns including dividends
- Cumulative performance from 2009
- Inflation-adjusted calculations included

### Inflation Data
- Hungary consumer price index
- US inflation for S&P 500 comparison
- Annual rates used for adjustments

## Customization

### Adding New Charts
1. Add chart configuration to `charts.js`
2. Include canvas element in markdown
3. Update chart initialization

### Modifying Data
- Edit the `chartData` object in `charts.js`
- Update markdown content as needed
- Refresh browser to see changes

### Styling Changes
- Modify CSS in `index.html`
- Chart colors can be changed in `charts.js`
- Responsive breakpoints in CSS

## License

This analysis is for educational and research purposes. Data sources are cited throughout the document.

---

*Created with Chart.js and Marked.js*
