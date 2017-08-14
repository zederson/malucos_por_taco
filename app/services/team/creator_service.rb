class Team
  class CreatorService
    attr_reader :player_one, :player_two

    def initialize(player_one, player_two)
      @player_one = player_one
      @player_two = player_two
    end

    def load_or_create
      find_or_create_team
    end

    def find_or_create_team
      players    = [player_one, player_two]
      integrants = Integrant.where(player: players).group(:team).count
      team       = integrants.select { |_k, v| v == 2 }.first
      team.present? ? team.first : build_team(players)
    end

    def build_team(players)
      team = Team.new.tap { |instance| instance.players = players }
      team.save
      team
    end

    def self.find_or_create_from_players(params_player)
      player_one = Player.find(params_player['1']['id'])
      player_two = Player.find(params_player['2']['id'])
      new(player_one, player_two).load_or_create
    end
  end
end
