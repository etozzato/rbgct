module Rbgct::Charts

  class BarChart

    include Chart

    attr_accessor :name, :value, :name_label, :value_label, :is3D

    def initialize(data, opts)
      raise ArgumentError.new('name or value are not defined') unless opts[:name] && opts[:value]

      @data = data

      opts.each{ |method,arg| self.send("#{method}=",arg) if self.respond_to?(method)}

      opts[:chart_options] ||= {}
      opts[:chart_options].each{ |method,arg| self.send("#{method}=",arg) if self.respond_to?(method)}

      set_default_values # in Chart
      set_default_values_pie_chart
    end

    def data_columns
      "data.addColumn('string', '#{name_label}');
      data.addColumn('number', '#{value_label}');"
    end

    def data_rows
      data.inject([]) do |ary, el|
        ary << "      data.setValue(#{ary.size}, 0, '#{el.send(name)}');\n      data.setValue(#{ary.size}, 1, #{el.send(value)});"
      end.unshift("data.addRows(#{data.size});").join("\n")
    end

    def options_for_chart
      %(, is3D: "#{is3D}")
    end

    def set_default_values_pie_chart
      @is3D ||= true
    end

  end

end