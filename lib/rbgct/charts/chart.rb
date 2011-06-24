module Rbgct::Charts

    module Chart

      attr_accessor :max_value

      def jsapi
        <<-EOL
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
  google.load('visualization', '1', {packages: ['#{package}']});
</script>
        EOL
      end

      def draw_visualization_start
        <<-EOL
<script type="text/javascript">
  function drawVisualization() {
    // Create and populate the data table.
    var data = new google.visualization.DataTable();
        EOL
      end

      def draw_visualization_end
        <<-EOL

  // Create and draw the visualization.
  new google.visualization.LineChart(document.getElementById('visualization')).
    draw(data, {curveType: "function",
      width: 1000, height: 400,
      vAxis: {maxValue: #{max_value}}}
    );
  }

  google.setOnLoadCallback(drawVisualization);
</script>
<div id="visualization" style="width: 1000px; height: 400px;"></div>
        EOL
      end

      def package
        case self.opts[:type]
        when :line_chart
          'corechart'
        end
      end

      def max_value
        @max_value ||= data.map(&:"#{opts[:y_method]}").flatten.max
      end

    end

end