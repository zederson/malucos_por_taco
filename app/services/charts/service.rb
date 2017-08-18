module Charts
  class Service
    attr_reader :matches

    def initialize(matches)
      @matches = matches
    end

    def pie_quantity_player
      QuantityPlayersService.new(matches).run
    end

    def pie_quantity_team
      QuantityTeamsService.new(matches).run
    end

    def staked_bar
      QuantityScoutService.new(matches).run
    end
  end
end
