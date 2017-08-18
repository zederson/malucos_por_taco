module Charts
  class ChartBaseService
    attr_reader :matches, :options

    def initialize(matches, options = {})
      @matches = matches
      @options = options
    end

    delegate :size, to: :matches
  end
end
