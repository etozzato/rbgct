# RbGCT - Ruby Google Chart Tools
### because charting should be a pleasure!

<pre>
$ gem install rbgct
</pre>

## Line Chart
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

## Line Chart output in HTML
<pre>
	<script type="text/javascript" src="http://www.google.com/jsapi"></script>
	<script type="text/javascript">
	  google.load('visualization', '1', {packages: ['corechart']});
	</script>

	<script type="text/javascript">
	  function drawVisualization() {
	    // Create and populate the data table.
	    var data = new google.visualization.DataTable();

	data.addColumn('string', 'time');
	data.addColumn('number', 'transactions');
	data.addRow(['10:58', 184]);
	data.addRow(['11:03', 380]);
	data.addRow(['11:08', 231]);
	data.addRow(['11:13', 133]);
	data.addRow(['11:18', 282]);
	data.addRow(['11:23', 99]);
	data.addRow(['11:28', 86]);
	data.addRow(['11:33', 50]);
	data.addRow(['11:38', 144]);
	data.addRow(['11:43', 399]);
	data.addRow(['11:48', 38]);
	data.addRow(['11:53', 466]);
	data.addRow(['11:58', 402]);
	data.addRow(['12:03', 365]);
	data.addRow(['12:08', 408]);
	data.addRow(['12:13', 436]);
	data.addRow(['12:18', 248]);
	data.addRow(['12:23', 156]);
	data.addRow(['12:28', 109]);
	data.addRow(['12:33', 272]);
	data.addRow(['12:38', 290]);
	data.addRow(['12:43', 465]);
	data.addRow(['12:48', 301]);
	data.addRow(['12:53', 171]);
	data.addRow(['12:58', 223]);
	data.addRow(['13:03', 157]);
	data.addRow(['13:08', 139]);
	data.addRow(['13:13', 115]);
	data.addRow(['13:18', 205]);
	data.addRow(['13:23', 314]);
	data.addRow(['13:28', 443]);
	data.addRow(['13:33', 428]);
	data.addRow(['13:38', 462]);
	data.addRow(['13:43', 347]);
	data.addRow(['13:48', 291]);
	data.addRow(['13:53', 69]);
	data.addRow(['13:58', 383]);
	data.addRow(['14:03', 84]);
	data.addRow(['14:08', 247]);
	data.addRow(['14:13', 73]);
	data.addRow(['14:18', 9]);
	data.addRow(['14:23', 120]);
	data.addRow(['14:28', 17]);
	data.addRow(['14:33', 441]);
	data.addRow(['14:38', 161]);
	data.addRow(['14:43', 154]);
	data.addRow(['14:48', 281]);
	data.addRow(['14:53', 498]);
	data.addRow(['14:58', 363]);
	data.addRow(['15:03', 11]);
	data.addRow(['15:08', 99]);
	data.addRow(['15:13', 84]);
	data.addRow(['15:18', 460]);
	data.addRow(['15:23', 350]);
	data.addRow(['15:28', 204]);
	data.addRow(['15:33', 177]);
	data.addRow(['15:38', 174]);
	data.addRow(['15:43', 200]);
	data.addRow(['15:48', 111]);
	data.addRow(['15:53', 293]);
	data.addRow(['15:58', 112]);
	data.addRow(['16:03', 274]);
	data.addRow(['16:08', 43]);
	data.addRow(['16:13', 324]);
	data.addRow(['16:18', 190]);
	data.addRow(['16:23', 371]);
	data.addRow(['16:28', 455]);
	data.addRow(['16:33', 63]);
	data.addRow(['16:38', 432]);
	data.addRow(['16:43', 63]);
	data.addRow(['16:48', 17]);
	data.addRow(['16:53', 377]);
	data.addRow(['16:58', 176]);
	data.addRow(['17:03', 211]);
	data.addRow(['17:08', 105]);
	data.addRow(['17:13', 18]);
	data.addRow(['17:18', 46]);
	data.addRow(['17:23', 368]);
	data.addRow(['17:28', 171]);
	data.addRow(['17:33', 404]);
	data.addRow(['17:38', 82]);
	data.addRow(['17:43', 417]);
	data.addRow(['17:48', 13]);
	data.addRow(['17:53', 189]);
	data.addRow(['17:58', 216]);
	data.addRow(['18:03', 259]);
	data.addRow(['18:08', 4]);
	data.addRow(['18:13', 4]);
	data.addRow(['18:18', 339]);
	data.addRow(['18:23', 5]);
	data.addRow(['18:28', 194]);
	data.addRow(['18:33', 127]);
	data.addRow(['18:38', 247]);
	data.addRow(['18:43', 42]);
	data.addRow(['18:48', 29]);
	data.addRow(['18:53', 357]);
	data.addRow(['18:58', 65]);
	data.addRow(['19:03', 300]);
	data.addRow(['19:08', 355]);
	data.addRow(['19:13', 58]);
	data.addRow(['19:18', 58]);

	  // Create and draw the visualization.
	  new google.visualization.LineChart(document.getElementById('transactions_linechart')).
	    draw(data, {width: 1600, height: 600 , vAxis: {maxValue: 498}, curveType: "function"});
	  }

	  google.setOnLoadCallback(drawVisualization);
	</script>
	<div id="transactions_linechart" style="width: 1600px; height: 600px;"></div>

</pre>

## Line Chart in Google Beauty
![Line Graph](http://mekdigital.com/files/rbgct_example.png "Title")