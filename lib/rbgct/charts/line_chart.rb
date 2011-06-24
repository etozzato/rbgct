module Rbgct::Charts

    class LineChart

      include Chart

      attr_accessor :x_label, :x_method, :y_label, :y_method
      attr_accessor :max_value

      def initialize(data, opts)
        @data = data

        opts.each{ |method,arg| self.send("#{method}=",arg) if self.respond_to?(method)}
        opts[:chart_options].each{ |method,arg| self.send("#{method}=",arg) if self.respond_to?(method)}

        @max_value = data.map(&:"#{y_method}").flatten.max

        set_default_values # in Chart
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
        "data.addColumn('string', '#{x_label}');\n" +
        Array(y_label).map{|lbl| %(data.addColumn('number', '#{lbl}');)}.join("\n")
      end

      def data_rows
        data.map do |row|
          %(data.addRow(['#{row.send(x_method)}', #{Array(row.send(y_method)).join(",")}]);)
        end.join("\n")
      end
    end
end
