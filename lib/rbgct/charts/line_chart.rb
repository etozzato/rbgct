module Rbgct::Charts

    class LineChart

      include Chart

      attr_accessor :x_label, :x_method, :y_label, :y_method, :curve_type
      attr_accessor :max_value

      def initialize(data, opts)
        raise ArgumentError.new('x_method or y_method are not defined') unless opts[:x_method] && opts[:y_method]

        @data = data

        opts.each{ |method,arg| self.send("#{method}=",arg) if self.respond_to?(method)}

        opts[:chart_options] ||= {}
        opts[:chart_options].each{ |method,arg| self.send("#{method}=",arg) if self.respond_to?(method)}

        @max_value = data.map(&:"#{y_method}").flatten.max

        set_default_values # in Chart
        set_default_values_line_chart
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
          %(data.addRow(['#{eval_x_strftime(row.send(x_method))}', #{Array(eval_y_strftime(row.send(y_method))).join(",")}]);)
        end.join("\n")
      end

      def options_for_chart
        %(, curveType: "#{curve_type}", vAxis: {maxValue: #{max_value}, title: "#{v_title}"}, hAxis: {title: "#{h_title}"})
      end

      def eval_x_strftime(val)
        if respond_to?(:x_strftime) && x_strftime && val.respond_to?(:strftime)
          val.send(:strftime, x_strftime)
        else
          val
        end
      end

      def eval_y_strftime(val)
        if respond_to?(:y_strftime) && y_strftime && val.respond_to?(:strftime)
          val.send(:strftime, y_strftime)
        else
          val
        end
      end

      def set_default_values_line_chart
        @y_label    ||= 'Y'
        @x_label    ||= 'X'
        @curve_type ||= 'none'
      end

    end
end
