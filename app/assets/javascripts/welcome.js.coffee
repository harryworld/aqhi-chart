# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#container").highcharts
    chart:
      zoomType: "xy"

    title:
      text: "Air Quality for Hong Kong"

    subtitle:
      text: "Source: EPD (Last 24 Hours)"

    xAxis: [categories: [
      "09:00"
      "10:00"
      "11:00"
      "12:00"
      "13:00"
      "14:00"
      "15:00"
      "16:00"
      "17:00"
      "18:00"
      "19:00"
      "20:00"
    ]]
    yAxis: [ # Primary yAxis
      {
        labels:
          format: "{value}°C"
          style:
            color: Highcharts.getOptions().colors[2]

        title:
          text: "Temperature"
          style:
            color: Highcharts.getOptions().colors[2]

        opposite: true
      }
      {
        # Secondary yAxis
        gridLineWidth: 0
        title:
          text: "All Pollutants"
          style:
            color: Highcharts.getOptions().colors[0]

        labels:
          format: "{value} mm"
          style:
            color: Highcharts.getOptions().colors[0]
      }
      {
        # Tertiary yAxis
        gridLineWidth: 0
        title:
          text: "Sea-Level Pressure"
          style:
            color: Highcharts.getOptions().colors[1]

        labels:
          format: "{value} mb"
          style:
            color: Highcharts.getOptions().colors[1]

        opposite: true
      }
    ]
    tooltip:
      shared: true

    legend:
      layout: "vertical"
      align: "left"
      x: 120
      verticalAlign: "top"
      y: 80
      floating: true
      backgroundColor: (Highcharts.theme and Highcharts.theme.legendBackgroundColor) or "#FFFFFF"

    series: [
      {
        name: "All Pollutants"
        type: "column"
        yAxis: 1
        data: [
          49.9
          71.5
          106.4
          129.2
          144.0
          176.0
          135.6
          148.5
          216.4
          194.1
          95.6
          54.4
        ]
        tooltip:
          valueSuffix: " mm"
      }
      {
        name: "Sea-Level Pressure"
        type: "spline"
        yAxis: 2
        data: [
          1016
          1016
          1015.9
          1015.5
          1012.3
          1009.5
          1009.6
          1010.2
          1013.1
          1016.9
          1018.2
          1016.7
        ]
        marker:
          enabled: false

        dashStyle: "shortdot"
        tooltip:
          valueSuffix: " mb"
      }
      {
        name: "Temperature"
        type: "spline"
        data: [
          7.0
          6.9
          9.5
          14.5
          18.2
          21.5
          25.2
          26.5
          23.3
          18.3
          13.9
          9.6
        ]
        tooltip:
          valueSuffix: " °C"
      }
    ]

  return
