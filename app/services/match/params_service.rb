class Match
  module ParamsService
    def parse_scouts
      ('a'..'b').map { |v| scout_params v }
    end

    def parse_teams
      ('a'..'b').map { |v| player_params v }
    end

    def match_params
      dates = (1..5).map do |i|
        ["started_at(#{i}i)", "finished_at(#{i}i)"]
      end
      params.require(:match).permit(dates.flatten)
    end

    private

    def player_params(team)
      params.require("player_#{team}").permit('1': [:id], '2': [:id])
    end

    def scout_params(team)
      vals = Scout.keys << :id
      params.require("scout_#{team}").permit(vals)
    end
  end
end
