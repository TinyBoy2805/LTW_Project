

const fetchData = async (url) => {
   const response = await fetch(url);
   if (!response.ok) throw new Error("Failed to fetch API");
   return response.json();
}

const query = document.querySelector.bind(document)
const queryAll = document.querySelectorAll.bind(document)

document.addEventListener("DOMContentLoaded", async () => {
    const dashboardData = await fetchData("/LTW_Project_war_exploded/admin/dashboard/api")
        .then(data => data);

    const todayRevenue = query("#today-revenue")
    const monthRevenue = query("#month-revenue")
    const yearRevenue = query("#year-revenue")

    todayRevenue.innerHTML = dashboardData["dayRevenue"].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") + "đ"
    monthRevenue.innerHTML = dashboardData["monthRevenue"].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") + "đ"
    yearRevenue.innerHTML = dashboardData["yearRevenue"].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") + "đ"


    const chartPie = query("#pie");

    // bieu do tron
    const topProduct = dashboardData["topProducts"];
    if (chartPie) {
        const productPieChart = echarts.init(chartPie);
        const pieOption = {
            tooltip: {
                trigger: 'item'
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: [
                    topProduct[0]["name"],
                    topProduct[1]["name"],
                    topProduct[2]["name"]
                ],
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
                        { value: topProduct[0]["buyCount"], name: topProduct[0]["name"] },
                        { value: topProduct[1]["buyCount"], name: topProduct[1]["name"] },
                        { value: topProduct[2]["buyCount"], name: topProduct[2]["name"] }
                    ]
                }
            ]
        };
        productPieChart.setOption(pieOption);
    }


    const chartBar = query("#bar")
    const monthlyRevenues = dashboardData["topMonthlyRevenue"]
    if (chartBar) {
        const revenueBarChart = echarts.init(chartBar);
        const months = monthlyRevenues.map(mr => mr["month"]);
        const revenues = monthlyRevenues.map(mr => mr["monthlyRevenue"])
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
                data: months
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
                    data: revenues,
                    type: 'bar',
                    itemStyle: {

                        color: new echarts.graphic.LinearGradient(
                            0, 0, 0, 1,
                            [
                                { offset: 0, color: '#F654a9' },
                                { offset: 1, color: '#ffc8e2' }
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


    renderTable(dashboardData);
})


const renderTable = (dashboardData) => {
    const topInventories = dashboardData["topInventory"];
    let order = 1;
    topInventories.forEach(inventory => {
        let columnString = ``;
        const tbody = query(".tbody-table");
        const tr = document.createElement('tr')
        columnString += columnRender(
            order,
            inventory["id"],
            inventory["name"],
            inventory["brand"],
            inventory["quantity"],
            inventory["price"].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") + "đ"
        )
        order++;
        tr.innerHTML = columnString;
        tbody.append(tr);
    })
}

const columnRender = (order, productId, name, origin, quantity, price) => {
    return `
        <td class="numerical">${order}</td>
        <td class="id">${productId}</td>
        <td class="name">${name}</td>
        <td class="origin">${origin}</td>
        <td class="status">${quantity}</td>
        <td>${price}</td>
    `
}