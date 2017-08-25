module Charts
  class QuantityPlayersService < ChartBaseService
    def run
      { data: build }
    end

    private

    def build
      group.map do |_k, v|
        { name: v.first.title, y: v.size }
      end
    end

    def group
      scouts  = matches.flat_map(&:scouts)
      players = scouts.flat_map { |s| s.team.players }
      players.group_by(&:id)
    end
  end
end
