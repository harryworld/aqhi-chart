# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  pm25Array = []
  pm10Array = []
  no2Array = []
  so2Array = []
  xCat = []

  $.getJSON "/hours/latest.json", (data) ->
    $.each data, (k, v) ->
      pm25Array.push v.pm25
      pm10Array.push v.pm10
      no2Array.push v.no2
      so2Array.push v.so2
      xCat.push v.timeTitle

    load pm25Array, pm10Array, no2Array, so2Array, xCat


load = (pm25, pm10, no2, so2, xCat) ->
  $("#container").highcharts
    chart:
      zoomType: "xy"

    title:
      text: "Air Quality for Hong Kong"

    subtitle:
      text: "Source: EPD (Last 24 Hours)"

    xAxis: [categories: xCat]
    yAxis: [ # Primary yAxis
      {
        # Tertiary yAxis
        gridLineWidth: 0
        title:
          text: "PM2.5"
          style:
            color: Highcharts.getOptions().colors[1]

        labels:
          format: "{value}"
          style:
            color: Highcharts.getOptions().colors[1]

        opposite: true
      }
      {
        labels:
          format: "{value}"
          style:
            color: Highcharts.getOptions().colors[2]

        title:
          text: "PM10"
          style:
            color: Highcharts.getOptions().colors[2]

        opposite: true
      }
      {
        # Secondary yAxis
        gridLineWidth: 0
        title:
          text: "NO2"
          style:
            color: Highcharts.getOptions().colors[0]

        labels:
          format: "{value}"
          style:
            color: Highcharts.getOptions().colors[0]
      }
      {
        # 4th yAxis
        gridLineWidth: 0
        title:
          text: "SO2"
          style:
            color: Highcharts.getOptions().colors[3]

        labels:
          format: "{value}"
          style:
            color: Highcharts.getOptions().colors[3]
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
        name: "PM2.5"
        type: "spline"
        data: pm25
        marker:
          enabled: false

        dashStyle: "shortdot"
        tooltip:
          valueSuffix: ""
      }
      {
        name: "PM10"
        type: "spline"
        yAxis: 1
        data: pm10
        tooltip:
          valueSuffix: ""

        dashStyle: "shortdot"
      }
      {
        name: "NO2"
        type: "spline"
        yAxis: 2
        data: no2
        tooltip:
          valueSuffix: ""
      }
      {
        name: "SO2"
        type: "spline"
        yAxis: 3
        data: so2
        marker:
          enabled: false

        tooltip:
          valueSuffix: ""
      }
    ]

  return
