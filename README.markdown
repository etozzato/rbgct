# RbGCT - Ruby Google Chart Tools
### because charting should be a pleasure!

<pre>
$ gem install rbgct
</pre>

## Line Chart
<pre>
SampleData = Struct.new(:date, :values)
fantasy_data = (0..100).to_a.map {|i| SampleData.new((Time.now + 60*5*i).strftime("%H:%M"), rand(500)) }

Rbgct.render(fantasy_data,{ :type     => :line_chart, 
							:x_method => :date, 
							:y_method => :value,
							:x_label  => :time,
							:y_label  => :transactions})
</pre>

## Line Chart In Action
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
data.addRow(['01:00', 7]);
data.addRow(['01:05', 314]);
data.addRow(['01:10', 267]);
data.addRow(['01:15', 39]);
data.addRow(['01:20', 240]);
data.addRow(['01:25', 461]);
data.addRow(['01:30', 86]);
data.addRow(['01:35', 336]);
data.addRow(['01:40', 486]);
data.addRow(['01:45', 170]);
data.addRow(['01:50', 191]);
data.addRow(['01:55', 252]);
data.addRow(['02:00', 375]);
data.addRow(['02:05', 432]);
data.addRow(['02:10', 106]);
data.addRow(['02:15', 495]);
data.addRow(['02:20', 226]);
data.addRow(['02:25', 255]);
data.addRow(['02:30', 20]);
data.addRow(['02:35', 335]);
data.addRow(['02:40', 116]);
data.addRow(['02:45', 125]);
data.addRow(['02:50', 53]);
data.addRow(['02:55', 341]);
data.addRow(['03:00', 189]);
data.addRow(['03:05', 303]);
data.addRow(['03:10', 156]);
data.addRow(['03:15', 388]);
data.addRow(['03:20', 228]);
data.addRow(['03:25', 291]);
data.addRow(['03:30', 173]);
data.addRow(['03:35', 456]);
data.addRow(['03:40', 203]);
data.addRow(['03:45', 186]);
data.addRow(['03:50', 7]);
data.addRow(['03:55', 49]);
data.addRow(['04:00', 444]);
data.addRow(['04:05', 12]);
data.addRow(['04:10', 37]);
data.addRow(['04:15', 490]);
data.addRow(['04:20', 2]);
data.addRow(['04:25', 155]);
data.addRow(['04:30', 50]);
data.addRow(['04:35', 235]);
data.addRow(['04:40', 412]);
data.addRow(['04:45', 167]);
data.addRow(['04:50', 89]);
data.addRow(['04:55', 488]);
data.addRow(['05:00', 74]);
data.addRow(['05:05', 353]);
data.addRow(['05:10', 262]);
data.addRow(['05:15', 89]);
data.addRow(['05:20', 374]);
data.addRow(['05:25', 296]);
data.addRow(['05:30', 275]);
data.addRow(['05:35', 105]);
data.addRow(['05:40', 70]);
data.addRow(['05:45', 409]);
data.addRow(['05:50', 429]);
data.addRow(['05:55', 445]);
data.addRow(['06:00', 38]);
data.addRow(['06:05', 125]);
data.addRow(['06:10', 340]);
data.addRow(['06:15', 425]);
data.addRow(['06:20', 189]);
data.addRow(['06:25', 357]);
data.addRow(['06:30', 220]);
data.addRow(['06:35', 69]);
data.addRow(['06:40', 344]);
data.addRow(['06:45', 292]);
data.addRow(['06:50', 243]);
data.addRow(['06:55', 287]);
data.addRow(['07:00', 162]);
data.addRow(['07:05', 116]);
data.addRow(['07:10', 174]);
data.addRow(['07:15', 187]);
data.addRow(['07:20', 227]);
data.addRow(['07:25', 425]);
data.addRow(['07:30', 376]);
data.addRow(['07:35', 387]);
data.addRow(['07:40', 210]);
data.addRow(['07:45', 136]);
data.addRow(['07:50', 202]);
data.addRow(['07:55', 471]);
data.addRow(['08:00', 313]);
data.addRow(['08:05', 63]);
data.addRow(['08:10', 326]);
data.addRow(['08:15', 482]);
data.addRow(['08:20', 190]);
data.addRow(['08:25', 183]);
data.addRow(['08:30', 434]);
data.addRow(['08:35', 242]);
data.addRow(['08:40', 257]);
data.addRow(['08:45', 42]);
data.addRow(['08:50', 279]);
data.addRow(['08:55', 223]);
data.addRow(['09:00', 103]);
data.addRow(['09:05', 447]);
data.addRow(['09:10', 41]);
data.addRow(['09:15', 325]);
data.addRow(['09:20', 327]);

  // Create and draw the visualization.
  new google.visualization.LineChart(document.getElementById('visualization')).
    draw(data, {curveType: "function",
      width: 1000, height: 400,
      vAxis: {maxValue: 495}}
    );
  }

  google.setOnLoadCallback(drawVisualization);
</script>
<div id="visualization" style="width: 1000px; height: 400px;"></div>
</pre>