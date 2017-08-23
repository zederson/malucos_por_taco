module Charts
  class QuantityWinnersService < ChartBaseService
    def run
      { data: build }
    end

    def build
      group.map do |_k, v|
        { name: v.first.title, y: v.size }
      end
    end

    def group
      target = options[:target]
      send "#{target}_group"
    end

    def teams_group
      scouts = matches.map(&:winner)
      teams  = scouts.map(&:team)
      teams.group_by(&:id)
    end

    def players_group
      scouts = matches.map(&:winner)
      players = scouts.flat_map { |s| s.team.players }
      players.group_by(&:id)
    end
  end
end
