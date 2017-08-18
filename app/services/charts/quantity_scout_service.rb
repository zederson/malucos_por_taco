module Charts
  class QuantityScoutService < ChartBaseService
    def run
      { items: build, categories: categories }
    end

    def build
      summarize.map do |item|
        { name: item[:name], data: build_data(item) }
      end
    end

    def build_data(item)
      items_from_chart.map { |i| item[i] }
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
      {
        id:           scout.team.id,
        name:         scout.team.title,
        run:          scout.run,
        back:         scout.back,
        lost_ball:    scout.lost_ball,
        bat_delivery: scout.bat_delivery,
        house:        scout.house,
        burned:       scout.burned,
        victory:      scout.victory,
        concierge:    scout.concierge
      }
    end

    def reduce(acc, current)
      {
        name:         current[:name],
        run:          (acc[:run] + current[:run]),
        back:         (acc[:back] + current[:back]),
        lost_ball:    (acc[:lost_ball] + current[:lost_ball]),
        bat_delivery: (acc[:bat_delivery] + current[:bat_delivery]),
        house:        (acc[:house] + current[:house]),
        burned:       (acc[:burned] + current[:burned]),
        victory:      (acc[:victory] + current[:victory]),
        concierge:    (acc[:concierge] + current[:concierge])
      }
    end

    def categories
      values = items_from_chart
      values.map { |val| Scout.human_attribute_name(val) }
    end

    def items_from_chart
      %i[run back lost_ball bat_delivery house burned victory concierge]
    end
  end
end
