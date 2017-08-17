var charts;
(function (charts) {
  'use strict';

  function subtitle() {
    return 'Malucos por Taco';
  }

  function pie(id, name, tooltip, data) {
    Highcharts.chart(id, {
      title: { text: name },
      subtitle: { text: subtitle() },
      tooltip: { pointFormat: tooltip + ': <b>{point.y}</b>' },

      chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
      },

      plotOptions: {
        pie: {
          allowPointSelect: true,
          cursor: 'pointer',
          dataLabels: {
            enabled: true,
            format: '<b>{point.name}</b>: {point.percentage:.1f} %',
            style: {
              color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
            },
            connectorColor: 'silver'
          }
        }
      },
      series: [data]
    });
  }
  charts.pie = pie;

  function column(id, name, data) {
  }
  charts.column = column

})(charts || (charts = {}));

