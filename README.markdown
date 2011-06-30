# RbGCT - Ruby Google Chart Tools
### because charting should be a pleasure!

<pre>
$ gem install rbgct
</pre>

## Implemented Classes

* [LineChart](http://code.google.com/apis/chart/interactive/docs/gallery/linechart.html)
* [PieChart](http://code.google.com/apis/chart/interactive/docs/gallery/piechart.html)

## TODO

*way too much!*

* Add Specs
* Add Documentation
* Implement More :chart_options
* Fix Known Bugs
* Implement:
	* Annotated Time Line
	* Area Chart
	* Bar Chart
	* Candlestick Chart
	* Chart Editor
	* Chart Wrapper
	* Column Chart
	* Combo Chart
	* Gauge
	* Geo Chart
	* Geo Map
	* Image Chart
	* Image Area Chart
	* Image Bar Chart
	* Image Candlestick Chart
	* Image Line Chart
	* Image Pie Chart
	* Intensity Map
	* Motion Chart
	* Org Chart
	* Scatter Chart
	* Sparkline
	* Table
	* Tree Map

## LineChart
<pre>
SampleData = Struct.new(:date, :values)
fantasy_data = (0..100).to_a.map {|i| SampleData.new((Time.now + 60*5*i).strftime("%H:%M"), rand(500)) }

Rbgct.render(fantasy_data,{
	:type     => :line_chart, 
	:x_method => :date, 
	:y_method => :values,
	:x_label  => :time,
	:y_label  => :transactions,
	:chart_options =>{
	  :width => 1600,
	  :height => 600,
	  :dom_id => 'transactions_linechart',
	  :curve_type => 'function'
}})
</pre>

## LineChart in Google Beauty
![LineChart RbGTC](http://mekdigital.com/files/rbgct_linechart_example.png "LineChart")

## PieChart
<pre>
SampleDataPieChart = Struct.new(:label, :value)
fantasy_data = ['OSX', 'WIN', 'LINUX'].map{ |os| SampleDataPieChart.new(os,rand(99999999))}

Rbgct.render(fantasy_data, {
	:type => :pie_chart,
	:name => :label,
	:value => :value,
	:name_label => 'Type',
	:value_label => 'Installations',
	:chart_options =>{
	  :width => 600,
	  :height => 600,
	  :dom_id => 'graph',
	  :is_3d => true,
	  :title => "Operating Systems Installations (2012)"
  }
})
</pre>

## PieChart in Google Beauty
![PieChart RbGTC](http://mekdigital.com/files/rbgct_piechart_example.png "PieChart")