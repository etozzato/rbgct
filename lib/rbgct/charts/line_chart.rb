module Rbgct::Charts

    class LineChart

      include Chart
      attr_accessor :data, :opts

      def initialize(data, opts)
        @data = data
        @opts = opts
      end

      def render
        <<-EOL
#{jsapi}
#{draw_visualization_start}
#{data_columns}
#{data_rows}
#{draw_visualization_end}
        EOL
      end

      def data_columns
        "data.addColumn('string', '#{opts[:x_label]}');\n" +
        Array(opts[:y_label]).map{|lbl| %(data.addColumn('number', '#{lbl}');)}.join("\n")
      end

      def data_rows
        data.map do |row|
          %(data.addRow(['#{row.send(opts[:x_method])}', #{Array(row.send(opts[:y_method])).join(",")}]);)
        end.join("\n")
      end
    end
end
