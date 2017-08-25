module Charts
  class QuantityScoutService < ChartBaseService
    def run
      { items: build, categories: categories }
    end

    private

    def build
      summarize.map do |item|
        { name: item[:name], data: build_data(item) }
      end
    end

    def build_data(item)
      chart_keys.map { |i| item[i] }
    end

    def summarize
      grouped = group
      grouped.map do |_, item|
        item.reduce do |acc, current|
          reduce acc, current
        end
      end
    end

    def group
      scouts = matches.flat_map(&:scouts)
      list   = scouts.map { |scout| build_item scout }
      list.group_by { |items| items[:id] }
    end

    def build_item(scout)
      values = chart_keys.map { |key| [key, scout.send(key)] }
      values << [:id, scout.team.id]
      values << [:name, scout.team.title]
      Hash[values]
    end

    def reduce(acc, current)
      values = chart_keys.map { |key| [key, (acc[key] + current[key])] }
      values << [:name, current[:name]]
      Hash[values]
    end

    def categories
      values = chart_keys
      values.map { |val| Scout.human_attribute_name(val) }
    end

    def chart_keys
      Scout.keys
    end
  end
end
