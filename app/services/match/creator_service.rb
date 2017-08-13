class Match
  class CreatorService
    attr_reader :match, :scouts, :team_a_params, :team_params

    def initialize(match_params, scout_params, team_params)
      @match          = Match.new(match_params)
      @scouts         = scout_params.map { |s| Scout.new(s) }
      @team_params  = team_params
    end

    def create
      Match.transaction do
        match.save
        create_scout
        match.reload
      end
    rescue
      nil
    end

    def create_scout
      scouts.each_with_index do |scout, index|
        scout.team  = team(team_params[index])
        scout.match = match
        scout.save
      end
    end

    def team(params)
      Team::CreatorService.find_or_create_from_players(params)
    end
  end
end
