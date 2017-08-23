module Charts
  class Service
    attr_reader :matches

    def initialize(matches)
      @matches = matches
    end

    def pie_quantity_player
      @pie_quantity_player ||= QuantityPlayersService.new(matches).run
    end

    def pie_quantity_team
      @pie_quantity_team ||= QuantityTeamsService.new(matches).run
    end

    def pie_teams_winners
      @pie_teams_winners ||= QuantityWinnersService.new(matches, target: :teams).run
    end

    def pie_players_winners
      @pie_players_winners ||= QuantityWinnersService.new(matches, target: :players).run
    end

    def staked_bar
      @staked_bar ||= QuantityScoutService.new(matches).run
    end
  end
end
