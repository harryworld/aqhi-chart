require 'open-uri'

class WelcomeController < ApplicationController
  def index
  end

  def data
    # Parse the URI and retrieve it to a temporary file
    news_tmp_file = open('http://www.aqhi.gov.hk/en/aqhi/past-24-hours-pollutant-concentration.html')

    # Parse the contents of the temporary file as HTML
    doc = Nokogiri::HTML(news_tmp_file)

    # Define the css selectors to be used for extractions, most
    tableRow         =".stationDetail #contentField table.tblNormal tr"

    # extract all the articles
    pollutants = doc.css(tableRow)

    #extract the title from the pollutants
    pollutants.each_with_index do |perHour, index|

      if index != 0
        hour = Hour.new

        title_node = perHour.css(".H24C_ColDateTime")
        value_nodes = perHour.css(".H24C_ColItem")

        title = title_node.first.text
        hour.no2 = value_nodes[0].text if value_nodes[0].text != '-'
        hour.o3  = value_nodes[1].text if value_nodes[1].text != '-'
        hour.so2 = value_nodes[2].text if value_nodes[2].text != '-'
        hour.co  = value_nodes[3].text if value_nodes[3].text != '-'
        hour.pm10  = value_nodes[4].text if value_nodes[4].text != '-'
        hour.pm25  = value_nodes[5].text if value_nodes[5].text != '-'

        hour.district_id = 1

        hour.save!

      end

    end

    render :text => "success"
  end
end
