module Charts
  class Service
    attr_reader :matches

    def initialize(matches)
      @matches = matches
    end

    def pie_quantity_player
      s = QuantityPlayersService.new(matches)
      s.run
    end
  end
end
