class Match
  class UpdaterService
    attr_reader :match

    def initialize(match)
      @match = match
    end

    def update(match_params, scouts, teams)
      Match.transaction do
        update_match match_params
        update_scouts scouts, teams
      end
    end

    def update_match(params)
      match.update(params)
    end

    def update_scouts(params, team_params)
      params.each_with_index do |scout_params, index|
        scout            = Scout.find(scout_params.delete(:id))
        scout.team       = team(team_params[index])
        scout.attributes = scout_params
        scout.save
      end
    end

    def team(params)
      Team::CreatorService.find_or_create_from_players(params)
    end
  end
end
