module Rbgct

  require './rbgct/chart_factory.rb'
  Dir.glob('./rbgct/charts/*.rb').each{|file| require file }

  class NotImplementedError < StandardError; end

  def self.render(data, opts={})
    chart = ChartFactory[opts[:type]]
    chart.render(data, opts)
  end
  
end

Rbgct.render({},{:type => :line_chart})
# Rbgct.render({},{})