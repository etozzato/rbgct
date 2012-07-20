module Rbgct

  require 'rbgct/chart_factory'
  require 'rbgct/charts/chart'
  require 'rbgct/charts/line_chart'
  require 'rbgct/charts/pie_chart'
  require 'rbgct/charts/bar_chart'

  class NotImplementedError < StandardError; end

  def self.include_javascript(package='corechart')
  <<-EOL
  <script type="text/javascript" src="http://www.google.com/jsapi"></script>
  <script type="text/javascript">
  google.load('visualization', '1', {packages: ['#{package}']});
  </script>
  EOL
  end

  def self.render(data, opts={})
    raise ArgumentError.new('Dataset must respond to :each') unless data.respond_to?(:each)
    chart = ChartFactory[opts[:type]].new(data,opts)
    chart.render
  end

end