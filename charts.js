// Budapest Housing Market Analysis - Interactive Charts
// Data and visualization for 2009-2025 comparison with S&P 500 and inner districts focus

// Chart.js configuration and data
const chartData = {
    // Budapest Housing Price Index (2015 = 100)
    budapestHousing: {
        labels: ['2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '2020', '2021', '2022', '2023', '2024', '2025'],
        data: [85, 87, 89, 92, 95, 98, 100, 110, 125, 145, 165, 180, 200, 240, 273, 300, 320]
    },

    // S&P 500 Total Returns (cumulative from 2009)
    sp500: {
        labels: ['2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '2020', '2021', '2022', '2023', '2024', '2025'],
        data: [100, 115.06, 117.49, 136.29, 180.48, 205.18, 207.99, 232.88, 283.69, 271.27, 356.85, 422.42, 543.67, 445.15, 562.15, 702.70, 775.08]
    },

    // Hungary Inflation Rates
    inflation: {
        labels: ['2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '2020', '2021', '2022', '2023', '2024', '2025'],
        data: [4.2, 4.9, 3.9, 5.7, 1.7, -0.2, 0.1, 0.4, 2.4, 2.8, 3.4, 3.3, 5.1, 14.6, 17.1, 3.7, 4.3]
    },

    // Housing Sales Volume (thousands)
    salesVolume: {
        labels: ['2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '2020', '2021', '2022', '2023', '2024', '2025'],
        data: [91.1, 90.3, 87.7, 86.0, 88.7, 113.8, 134.1, 146.3, 153.8, 163.7, 157.0, 134.0, 160.7, 138.0, 105.2, 48.1, 52.3]
    },

    // Inner Districts Price per m² (HUF thousands)
    innerDistricts: {
        labels: ['2015', '2016', '2017', '2018', '2019', '2020', '2021', '2022', '2023', '2024', '2025'],
        data: {
            districtV: [1800, 1950, 2200, 2500, 2800, 3000, 3200, 3800, 4200, 4500, 5200],
            districtVI: [1500, 1650, 1850, 2100, 2350, 2500, 2700, 3200, 3500, 3750, 4200],
            districtVII: [1300, 1450, 1650, 1850, 2050, 2200, 2400, 2850, 3150, 3350, 3750],
            districtXI: [1100, 1250, 1400, 1600, 1800, 1950, 2100, 2500, 2750, 2950, 3300]
        }
    }
};

// Chart configurations
const chartConfigs = {
    performance: {
        type: 'line',
        data: {
            labels: chartData.budapestHousing.labels,
            datasets: [
                {
                    label: 'Budapest Housing Price Index (2015=100)',
                    data: chartData.budapestHousing.data,
                    borderColor: 'rgb(75, 192, 192)',
                    backgroundColor: 'rgba(75, 192, 192, 0.1)',
                    tension: 0.1,
                    fill: true,
                    yAxisID: 'y'
                },
                {
                    label: 'S&P 500 Total Return Index (2009=100)',
                    data: chartData.sp500.data,
                    borderColor: 'rgb(255, 99, 132)',
                    backgroundColor: 'rgba(255, 99, 132, 0.1)',
                    tension: 0.1,
                    fill: true,
                    yAxisID: 'y'
                }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                title: {
                    display: true,
                    text: 'Budapest Housing vs S&P 500 Performance (2009-2025)',
                    font: { size: 16, weight: 'bold' }
                },
                legend: {
                    position: 'top'
                },
                tooltip: {
                    mode: 'index',
                    intersect: false,
                    callbacks: {
                        label: function (context) {
                            const label = context.dataset.label || '';
                            const value = context.parsed.y;
                            if (label.includes('Housing')) {
                                return `${label}: ${value} (2015=100)`;
                            } else {
                                return `${label}: ${value.toFixed(2)} (2009=100)`;
                            }
                        }
                    }
                }
            },
            scales: {
                y: {
                    type: 'linear',
                    display: true,
                    position: 'left',
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: 'Index Value'
                    }
                },
                x: {
                    display: true,
                    title: {
                        display: true,
                        text: 'Year'
                    }
                }
            },
            interaction: {
                mode: 'nearest',
                axis: 'x',
                intersect: false
            }
        }
    },

    inflation: {
        type: 'bar',
        data: {
            labels: chartData.inflation.labels,
            datasets: [{
                label: 'Hungary Inflation Rate (%)',
                data: chartData.inflation.data,
                backgroundColor: chartData.inflation.data.map(value =>
                    value > 10 ? 'rgba(255, 99, 132, 0.8)' :
                        value > 5 ? 'rgba(255, 205, 86, 0.8)' :
                            'rgba(75, 192, 192, 0.8)'
                ),
                borderColor: chartData.inflation.data.map(value =>
                    value > 10 ? 'rgb(255, 99, 132)' :
                        value > 5 ? 'rgb(255, 205, 86)' :
                            'rgb(75, 192, 192)'
                ),
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                title: {
                    display: true,
                    text: 'Hungary Inflation Rate (2009-2025)',
                    font: { size: 16, weight: 'bold' }
                },
                legend: {
                    display: false
                },
                tooltip: {
                    callbacks: {
                        label: function (context) {
                            return `Inflation: ${context.parsed.y}%`;
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: 'Inflation Rate (%)'
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: 'Year'
                    }
                }
            }
        }
    },

    comparison: {
        type: 'line',
        data: {
            labels: chartData.budapestHousing.labels,
            datasets: [
                {
                    label: 'Budapest Housing (Real, Inflation-Adjusted)',
                    data: chartData.budapestHousing.data.map((value, index) => {
                        // Simple inflation adjustment calculation
                        const inflationFactor = (1 + chartData.inflation.data[index] / 100);
                        return value / inflationFactor;
                    }),
                    borderColor: 'rgb(54, 162, 235)',
                    backgroundColor: 'rgba(54, 162, 235, 0.1)',
                    tension: 0.1,
                    fill: false
                },
                {
                    label: 'S&P 500 (Real, Inflation-Adjusted)',
                    data: chartData.sp500.data.map((value, index) => {
                        // US inflation adjustment (simplified)
                        const usInflation = [2.7, 1.5, 3.0, 1.7, 1.5, 0.7, 0.7, 1.3, 2.1, 1.9, 2.3, 1.4, 7.0, 6.5, 3.4, 3.1, 3.2];
                        const inflationFactor = (1 + usInflation[index] / 100);
                        return value / inflationFactor;
                    }),
                    borderColor: 'rgb(255, 159, 64)',
                    backgroundColor: 'rgba(255, 159, 64, 0.1)',
                    tension: 0.1,
                    fill: false
                }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                title: {
                    display: true,
                    text: 'Inflation-Adjusted Performance Comparison',
                    font: { size: 16, weight: 'bold' }
                },
                legend: {
                    position: 'top'
                },
                tooltip: {
                    mode: 'index',
                    intersect: false
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: 'Inflation-Adjusted Index Value'
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: 'Year'
                    }
                }
            },
            interaction: {
                mode: 'nearest',
                axis: 'x',
                intersect: false
            }
        }
    },

    districts: {
        type: 'line',
        data: {
            labels: chartData.innerDistricts.labels,
            datasets: [
                {
                    label: 'District V (Belváros)',
                    data: chartData.innerDistricts.data.districtV,
                    borderColor: 'rgb(255, 99, 132)',
                    backgroundColor: 'rgba(255, 99, 132, 0.1)',
                    tension: 0.1,
                    fill: false
                },
                {
                    label: 'District VI (Terézváros)',
                    data: chartData.innerDistricts.data.districtVI,
                    borderColor: 'rgb(54, 162, 235)',
                    backgroundColor: 'rgba(54, 162, 235, 0.1)',
                    tension: 0.1,
                    fill: false
                },
                {
                    label: 'District VII (Erzsébetváros)',
                    data: chartData.innerDistricts.data.districtVII,
                    borderColor: 'rgb(255, 205, 86)',
                    backgroundColor: 'rgba(255, 205, 86, 0.1)',
                    tension: 0.1,
                    fill: false
                },
                {
                    label: 'District XI (Újbuda)',
                    data: chartData.innerDistricts.data.districtXI,
                    borderColor: 'rgb(75, 192, 192)',
                    backgroundColor: 'rgba(75, 192, 192, 0.1)',
                    tension: 0.1,
                    fill: false
                }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                title: {
                    display: true,
                    text: 'Budapest Inner Districts Price per m² (2015-2025)',
                    font: { size: 16, weight: 'bold' }
                },
                legend: {
                    position: 'top'
                },
                tooltip: {
                    mode: 'index',
                    intersect: false,
                    callbacks: {
                        label: function (context) {
                            const label = context.dataset.label || '';
                            const value = context.parsed.y;
                            return `${label}: HUF ${value.toLocaleString()}/m²`;
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    title: {
                        display: true,
                        text: 'Price per m² (HUF thousands)'
                    },
                    ticks: {
                        callback: function (value) {
                            return 'HUF ' + value.toLocaleString();
                        }
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: 'Year'
                    }
                }
            },
            interaction: {
                mode: 'nearest',
                axis: 'x',
                intersect: false
            }
        }
    }
};

// Initialize charts when DOM is loaded
document.addEventListener('DOMContentLoaded', function () {
    console.log('DOM loaded, initializing charts...');

    // Wait a bit for everything to be ready
    setTimeout(() => {
        initializeCharts();
    }, 100);
});

// Initialize all charts
function initializeCharts() {
    console.log('Initializing charts...');

    // Performance comparison chart
    const performanceCtx = document.getElementById('performanceChart');
    if (performanceCtx) {
        console.log('Creating performance chart...');
        try {
            const performanceChart = new Chart(performanceCtx, chartConfigs.performance);
            console.log('Performance chart created successfully');
        } catch (error) {
            console.error('Error creating performance chart:', error);
        }
    } else {
        console.error('Performance chart canvas not found');
    }

    // Inflation chart
    const inflationCtx = document.getElementById('inflationChart');
    if (inflationCtx) {
        console.log('Creating inflation chart...');
        try {
            const inflationChart = new Chart(inflationCtx, chartConfigs.inflation);
            console.log('Inflation chart created successfully');
        } catch (error) {
            console.error('Error creating inflation chart:', error);
        }
    } else {
        console.error('Inflation chart canvas not found');
    }

    // Comparison chart
    const comparisonCtx = document.getElementById('comparisonChart');
    if (comparisonCtx) {
        console.log('Creating comparison chart...');
        try {
            const comparisonChart = new Chart(comparisonCtx, chartConfigs.comparison);
            console.log('Comparison chart created successfully');
        } catch (error) {
            console.error('Error creating comparison chart:', error);
        }
    } else {
        console.error('Comparison chart canvas not found');
    }

    // Districts chart
    const districtsCtx = document.getElementById('districtsChart');
    if (districtsCtx) {
        console.log('Creating districts chart...');
        try {
            const districtsChart = new Chart(districtsCtx, chartConfigs.districts);
            console.log('Districts chart created successfully');
        } catch (error) {
            console.error('Error creating districts chart:', error);
        }
    } else {
        console.error('Districts chart canvas not found');
    }

    // Add chart container styling
    addChartStyling();
}

// Add responsive styling for chart containers
function addChartStyling() {
    const chartContainers = document.querySelectorAll('[id$="-chart-container"]');
    chartContainers.forEach(container => {
        container.style.margin = '2rem 0';
        container.style.padding = '1rem';
        container.style.border = '1px solid #e0e0e0';
        container.style.borderRadius = '8px';
        container.style.backgroundColor = '#fafafa';
        container.style.minHeight = '400px';
    });
}

// Utility function to calculate cumulative returns
function calculateCumulativeReturns(annualReturns) {
    let cumulative = 100; // Start with 100
    return annualReturns.map(return_ => {
        cumulative *= (1 + return_ / 100);
        return cumulative;
    });
}

// Export data for external use
window.budapestHousingData = {
    chartData,
    chartConfigs,
    calculateCumulativeReturns
};
