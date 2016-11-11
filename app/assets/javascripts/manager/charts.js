$(function () {
    //IN PROGRESS - DO NOT MESS WITH THIS:
// this is just for ali to remember how to extract the month from a timestamp. This is probably not the best way to do it.
// glide.subscriptions.order("date_trunc('month', created_at)")
    if (!Highcharts.theme) {
        Highcharts.setOptions({
            chart: {
                backgroundColor: 'white'
            },
            colors: ['#904CFF', '#F44A3A', '#2DC7FC'],
            title: {
                style: {
                    color: '#904CFF'
                }
            },
            tooltip: {
                style: {
                    color: '#767676', // text color in hover over details box ** change this from purple
                    backgroundColor: "#000"
                },
                crosshairs: true,
                shared: true
            },
        });
    }

    Highcharts.chart('chart-container', {
        chart: {
            type: 'areaspline'
        },
        title: {
            text: 'KarmaBear Activity Report'
        },
        subtitle: {
            text: '2016'
        },
        xAxis: {
            categories: [
                'JAN',
                'FEB',
                'MAR',
                'APRIL',
                'MAY',
                'JUN',
                'JUL',
                'AUG',
                'SEP',
                'OCT',
                'NOV',
                'DEC']
        },
        yAxis: {
            title: {
                text: 'Number of KarmaBears'
            }
        },
        tooltip: {
            shared: true,
            valueSuffix: ' KarmaBears'
        },
        credits: {
            enabled: false
        },
        plotOptions: {
            areaspline: {
                fillOpacity: 0.5,
                lineWidth: 3,
            }
        },
        series: [{
            name: 'Donors',
            data: [3, 4, 3, 5, 4, 10, 12, 20, 8, 10, 3, 27]
        }, {
            name: 'Followers',
            data: [1, 3, 4, 3, 3, 5, 4, 8, 17, 45, 23, 10]
        }, {
            name: 'Volunteers',
            data: [6, 5, 4,12,5,6,8, 13, 20, 4, 12, 24]
        }]
    });
});
