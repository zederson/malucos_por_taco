class Match
  class CreatorService

    attr_reader :match, :scouts, :team_a_params, :team_b_params

    def initialize(match_params, scout_params, team_a_params, team_b_params)
      @match          = Match.new(match_params)
      @scouts         = scout_params.map { |s| Scout.new(s) }
      @team_a_params  = team_a_params
      @team_b_params  = team_b_params
    end

    def create
    end

    def team_a
      @team_a ||= Team::CreatorService.find_or_create_from_players(team_a_params)
    end

    def team_b
      @team_b ||= Team::CreatorService.find_or_create_from_players(team_b_params)
    end
  end
end
