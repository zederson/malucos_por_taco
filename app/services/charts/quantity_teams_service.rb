module Charts
  class QuantityTeamsService < ChartBaseService
    def run
      { data: build }
    end

    def build
      group.map do |_k, v|
        { name: v.first.title, y: v.size }
      end
    end

    def group
      scouts = matches.flat_map(&:scouts)
      teams  = scouts.flat_map(&:team)
      teams.group_by(&:id)
    end
  end
end
