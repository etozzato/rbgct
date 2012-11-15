module Rbgct

  require 'rbgct/chart_factory'
  require 'rbgct/charts/chart'
  require 'rbgct/charts/line_chart'
  require 'rbgct/charts/pie_chart'
  require 'rbgct/charts/bar_chart'

  class NotImplementedError < StandardError; end

  def self.include_javascript(packages=['corechart','table'])
  <<-EOL
  <script type="text/javascript" src="//www.google.com/jsapi"></script>
  <script type="text/javascript">
  var rbgct = {

    "graphs" : {},

    "loadedPackages" : [],

    "packages" : ['#{packages.join("\',\'")}'],

    "drawGraphs"  : (function(){
        for(var i in rbgct.graphs){
          rbgct.graphs[i]();
        }
    }),

    "loadPackages" : (function(){
      for(var i in rbgct.packages){
        if( rbgct.loadedPackages.indexOf(rbgct.packages[i]) == -1 ){
          google.load('visualization', '1', {packages: [rbgct.packages[i]]}); 
          rbgct.loadedPackages.push(rbgct.packages[i]); 
        }
      }
      google.setOnLoadCallback(rbgct.drawGraphs)
    })
  };
  rbgct.loadPackages();
  </script>
  EOL
  end

  def self.render(data, opts={})
    raise ArgumentError.new('Dataset must respond to :each') unless data.respond_to?(:each)
    chart = ChartFactory[opts[:type]].new(data,opts)
    chart.render
  end

end