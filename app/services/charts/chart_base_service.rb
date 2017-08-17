module Charts
  class ChartBaseService
    attr_reader :matches

    def initialize(matches)
      @matches = matches
    end

    delegate :size, to: :matches
  end
end
