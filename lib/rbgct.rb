module Rbgct

  require 'rbgct/chart_factory'
  require 'rbgct/charts/chart'
  require 'rbgct/charts/line_chart'

  class NotImplementedError < StandardError; end

  def self.render(data, opts={})
    chart = ChartFactory[opts[:type]].new(data,opts)
    chart.render
  end

end