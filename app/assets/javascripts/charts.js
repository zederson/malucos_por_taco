var charts;
(function (charts) {
  'use strict';

  function subtitle() {
    return 'Malucos por Taco';
  }

  function pie(id, name, tooltip, data, options) {
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
        pie: options
      },
      series: [data]
    });
  }
  charts.pie = pie;

  function pieOptions(legend) {
    var options = { };

    if (legend) {
      options = {
        allowPointSelect: true,
        cursor: 'pointer',
        dataLabels: {
          enabled: true,
            format: '<b>{point.name}</b>: {point.percentage:.1f} %',
            style: { color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black' },
            connectorColor: 'silver' }
      };
    } else {
      options = {
        allowPointSelect: true, cursor: 'pointer',
        dataLabels: { enabled: false },
        showInLegend: true
      };
    }
    return options;
  }
  charts.pieOptions = pieOptions;

  function column(id, name, data) {
  }
  charts.column = column

})(charts || (charts = {}));

