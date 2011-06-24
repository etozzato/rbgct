module Rbgct::Charts

    module Chart
      
      DEFAULT_WIDTH  = 600
      DEFAULT_HEIGHT = 400

      attr_accessor :data, :type
      attr_accessor :width, :height

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
      width: #{width}, height: #{height},
      vAxis: {maxValue: #{max_value}}}
    );
  }

  google.setOnLoadCallback(drawVisualization);
</script>
<div id="visualization" style="width: #{width}px; height: #{height}px;"></div>
        EOL
      end

      def package
        case type
        when :line_chart
          'corechart'
        end
      end

      def set_default_values
        @width     ||= DEFAULT_WIDTH
        @height    ||= DEFAULT_HEIGHT
      end

    end

end