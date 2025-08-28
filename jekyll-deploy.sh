#!/bin/bash

# Budapest Housing Analysis - Jekyll Auto-Deploy Script
# This script automatically syncs the updated analysis to your Jekyll site

echo "🚀 Budapest Housing Analysis - Jekyll Auto-Deploy"
echo "================================================"
echo ""

# Configuration - Update these paths for your setup
JEKYLL_SITE_PATH="${JEKYLL_SITE_PATH:-/Users/samuelbalogh/code/samuelbalogh.github.io}"
FINANCE_SOURCE_PATH="$(pwd)"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Jekyll site path exists
if [ ! -d "$JEKYLL_SITE_PATH" ]; then
    print_error "Jekyll site path not found: $JEKYLL_SITE_PATH"
    echo ""
    echo "Please set the JEKYLL_SITE_PATH environment variable:"
    echo "export JEKYLL_SITE_PATH=/path/to/your/jekyll/site"
    echo ""
    echo "Or update the script with the correct path."
    exit 1
fi

print_status "Jekyll site path: $JEKYLL_SITE_PATH"
print_status "Source path: $FINANCE_SOURCE_PATH"
echo ""

# Create backup of current Jekyll files
print_status "Creating backups of current Jekyll files..."
mkdir -p "$JEKYLL_SITE_PATH/backups/$TIMESTAMP"

if [ -f "$JEKYLL_SITE_PATH/_posts/2024-08-28-budapest-housing-analysis.md" ]; then
    cp "$JEKYLL_SITE_PATH/_posts/2024-08-28-budapest-housing-analysis.md" "$JEKYLL_SITE_PATH/backups/$TIMESTAMP/"
    print_success "Backed up existing post"
fi

if [ -f "$JEKYLL_SITE_PATH/assets/js/budapest-charts.js" ]; then
    cp "$JEKYLL_SITE_PATH/assets/js/budapest-charts.js" "$JEKYLL_SITE_PATH/backups/$TIMESTAMP/"
    print_success "Backed up existing charts"
fi

echo ""

# Create Jekyll post with updated content
print_status "Creating Jekyll post with updated analysis..."

# Create _posts directory if it doesn't exist
mkdir -p "$JEKYLL_SITE_PATH/_posts"

# Create the Jekyll post with front matter
cat > "$JEKYLL_SITE_PATH/_posts/2024-08-28-budapest-housing-analysis.md" << 'EOF'
---
layout: post
title: "Budapest Housing Market Analysis: 2009-2025"
date: 2024-08-28
last_modified_at: 2025-08-28
categories: [finance, real-estate, analysis]
tags: [budapest, housing, sp500, inflation, investment, inner-districts, psychology]
author: Samuel Balogh
excerpt: "A comprehensive analysis of Budapest housing market performance over 16 years, with focus on inner districts and psychological factors influencing real estate investment preferences in Eastern Europe."
---

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

EOF

# Append the main analysis content (excluding the title since it's in front matter)
tail -n +3 "$FINANCE_SOURCE_PATH/budapest-housing-analysis.md" >> "$JEKYLL_SITE_PATH/_posts/2024-08-28-budapest-housing-analysis.md"

print_success "Created Jekyll post with updated content"
echo ""

# Create assets directory and copy charts
print_status "Setting up chart assets..."

# Create assets directory structure
mkdir -p "$JEKYLL_SITE_PATH/assets/js"
mkdir -p "$JEKYLL_SITE_PATH/assets/css"

# Copy charts.js to Jekyll assets
cp "$FINANCE_SOURCE_PATH/charts.js" "$JEKYLL_SITE_PATH/assets/js/budapest-charts.js"
print_success "Copied charts.js to Jekyll assets"

# Create CSS for chart styling
cat > "$JEKYLL_SITE_PATH/assets/css/budapest-analysis.css" << 'EOF'
/* Budapest Housing Analysis Chart Styles */
.chart-container {
    margin: 2rem 0;
    padding: 1rem;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    background-color: #fafafa;
    min-height: 400px;
}

#performance-chart-container,
#inflation-chart-container,
#comparison-chart-container,
#districts-chart-container {
    margin: 2rem 0;
    padding: 1rem;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    background-color: #fafafa;
    min-height: 400px;
}

/* Responsive design */
@media (max-width: 768px) {
    .chart-container {
        margin: 1rem 0;
        padding: 0.5rem;
    }
}
EOF

print_success "Created CSS styles for charts"
echo ""

# Create Jekyll layout for the analysis (optional)
print_status "Creating custom layout for analysis..."

cat > "$JEKYLL_SITE_PATH/_layouts/budapest-analysis.html" << 'EOF'
---
layout: default
---

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ page.title }}</title>
    
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="{{ '/assets/css/budapest-analysis.css' | relative_url }}">
    
    <!-- Include your site's default head -->
    {% raw %}{% include head.html %}{% endraw %}
</head>
<body>
    <div class="container">
        <article class="post">
            <header class="post-header">
                <h1 class="post-title">{% raw %}{{ page.title }}{% endraw %}</h1>
                <p class="post-meta">
                    <time datetime="{% raw %}{{ page.date | date_to_xmlschema }}{% endraw %}">
                        {% raw %}{{ page.date | date: "%B %-d, %Y" }}{% endraw %}
                    </time>
                    {% raw %}{% if page.author %}{% endraw %}
                    • {% raw %}{{ page.author }}{% endraw %}
                    {% raw %}{% endif %}{% endraw %}
                </p>
            </header>

            <div class="post-content">
                {% raw %}{{ content }}{% endraw %}
            </div>
        </article>
    </div>

    <!-- Load charts after content -->
    <script src="{% raw %}{{ '/assets/js/budapest-charts.js' | relative_url }}{% endraw %}"></script>
    
    <!-- Initialize charts -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            if (typeof initializeCharts === 'function') {
                initializeCharts();
            }
        });
    </script>
</body>
</html>
EOF

print_success "Created custom layout for analysis"
echo ""

# Create a finance section page
print_status "Creating finance section page..."

mkdir -p "$JEKYLL_SITE_PATH/finance"

cat > "$JEKYLL_SITE_PATH/finance/index.html" << 'EOF'
---
layout: default
title: "Finance Analysis"
---

<div class="container">
    <h1>Finance Analysis</h1>
    
    <div class="analysis-links">
        <h2>Budapest Housing Market Analysis</h2>
        <p>A comprehensive analysis of Budapest housing market performance over 16 years, with focus on inner districts and psychological factors influencing real estate investment preferences in Eastern Europe.</p>
        
        <a href="{% raw %}{{ '/2024/08/28/budapest-housing-analysis/' | relative_url }}{% endraw %}" class="btn btn-primary">
            Read Full Analysis
        </a>
        
        <div class="key-findings">
            <h3>Key Findings:</h3>
            <ul>
                <li>Budapest housing: ~250% return (2010-2025)</li>
                <li>Inner districts premium: 40-60% higher prices</li>
                <li>S&P 500: ~450-500% return (2009-2025)</li>
                <li>Psychological factors drive real estate preference</li>
            </ul>
        </div>
    </div>
</div>
EOF

print_success "Created finance section page"
echo ""

# Update Jekyll configuration if needed
print_status "Checking Jekyll configuration..."

if [ -f "$JEKYLL_SITE_PATH/_config.yml" ]; then
    # Check if finance category is configured
    if ! grep -q "finance" "$JEKYLL_SITE_PATH/_config.yml"; then
        print_warning "Consider adding 'finance' to your categories in _config.yml"
    fi
else
    print_warning "_config.yml not found - you may need to configure categories manually"
fi

echo ""

# Create deployment summary
print_status "Deployment Summary:"
echo "======================"
echo "📁 Jekyll Site: $JEKYLL_SITE_PATH"
echo "📄 Post Created: _posts/2024-08-28-budapest-housing-analysis.md"
echo "📊 Charts: assets/js/budapest-charts.js"
echo "🎨 Styles: assets/css/budapest-analysis.css"
echo "📋 Layout: _layouts/budapest-analysis.html"
echo "📂 Section: finance/index.html"
echo "💾 Backup: backups/$TIMESTAMP/"
echo ""

# Provide next steps
print_status "Next Steps:"
echo "============="
echo "1. 📝 Review the generated post:"
echo "   $JEKYLL_SITE_PATH/_posts/2024-08-28-budapest-housing-analysis.md"
echo ""
echo "2. 🏗️  Build your Jekyll site:"
echo "   cd $JEKYLL_SITE_PATH"
echo "   bundle exec jekyll build"
echo ""
echo "3. 🧪 Test locally:"
echo "   bundle exec jekyll serve"
echo "   Visit: http://localhost:4000/2024/08/28/budapest-housing-analysis/"
echo ""
echo "4. 🚀 Deploy to your hosting platform"
echo ""

# Check for common issues
print_status "Validation Checks:"
echo "====================="

# Check if all files were created
if [ -f "$JEKYLL_SITE_PATH/_posts/2024-08-28-budapest-housing-analysis.md" ]; then
    print_success "✓ Jekyll post created"
else
    print_error "✗ Jekyll post creation failed"
fi

if [ -f "$JEKYLL_SITE_PATH/assets/js/budapest-charts.js" ]; then
    print_success "✓ Charts file copied"
else
    print_error "✗ Charts file copy failed"
fi

if [ -f "$JEKYLL_SITE_PATH/assets/css/budapest-analysis.css" ]; then
    print_success "✓ CSS file created"
else
    print_error "✗ CSS file creation failed"
fi

echo ""
print_success "Auto-deploy completed successfully!"
print_status "Timestamp: $TIMESTAMP"
echo ""
echo "💡 Tip: Run this script whenever you update your analysis to automatically sync to Jekyll!"
