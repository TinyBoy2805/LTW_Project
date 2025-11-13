// echart
document.addEventListener('DOMContentLoaded', function () {
    // pie chart
    const pieChartDom = document.getElementById('pie');
    if (pieChartDom) {
        const productPieChart = echarts.init(pieChartDom);
        const pieOption = {
            tooltip: {
                trigger: 'item'
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: ['Sữa', 'Bột ăn dặm', 'Khác'],
                top: 'center'
            },
            color: ['#F654a9', '#ff99c8', '#bdbdbd'],
            series: [
                {
                    name: 'Sản phẩm',
                    type: 'pie',
                    radius: ['60%', '80%'],
                    center: ['75%', '50%'],
                    avoidLabelOverlap: false,
                    label: {
                        show: false,
                        position: 'center'
                    },
                    labelLine: {
                        show: false
                    },
                    data: [
                        { value: 1701, name: 'Sữa' },
                        { value: 407, name: 'Bột ăn dặm' },
                        { value: 323, name: 'Khác' }
                    ]
                }
            ]
        };
        productPieChart.setOption(pieOption);
    }


    // bar chart
    const barChartDom = document.getElementById('bar');
    if (barChartDom) {
        const revenueBarChart = echarts.init(barChartDom);
        const barOption = {
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                top: '10%',
                containLabel: true
            },
            xAxis: {
                type: 'category',
                data: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']
            },
            yAxis: {
                type: 'value',
                axisLabel: {
                    formatter: function (value) {
                        return (value / 10).toFixed(0); 
                    }
                }
            },
            series: [
                {
                    data: [180, 210, 240, 190, 280, 420, 500, 450, 380, 310, 250, 200], // Dữ liệu giả định
                    type: 'bar',
                    itemStyle: {
                        // Thiết lập màu sắc cột (gradient)
                        color: new echarts.graphic.LinearGradient(
                            0, 0, 0, 1,
                            [
                                { offset: 0, color: '#F654a9' }, // Màu hồng đậm ở trên
                                { offset: 1, color: '#ffc8e2' }  // Màu hồng nhạt ở dưới
                            ]
                        ),
                        borderRadius: [4, 4, 0, 0]
                    },
                    barWidth: '50%'
                }
            ]
        };
        revenueBarChart.setOption(barOption);
    }

    // Đảm bảo biểu đồ thay đổi kích thước khi cửa sổ thay đổi
    window.addEventListener('resize', function () {
        if (typeof productPieChart !== 'undefined') {
            productPieChart.resize();
        }
        if (typeof revenueBarChart !== 'undefined') {
            revenueBarChart.resize();
        }
    });

    setTimeout(() => {
        if (typeof productPieChart !== 'undefined') {
            productPieChart.resize();
        }
        if (typeof revenueBarChart !== 'undefined') {
            revenueBarChart.resize();
        }
    }, 300); // 300ms là thời gian transition của sidebar
});