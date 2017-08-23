class HomeDecorate
  attr_reader :matches

  def initialize(matches)
    @matches = matches || []
  end

  delegate :size, to: :matches

  def players_winners
    scouts = matches.map(&:winner)
    extract_players scouts
  end

  def players_losers
    scouts = matches.map(&:loser)
    extract_players scouts
  end

  def count_players
    scouts  = matches.flat_map(&:scouts)
    players = extract_players scouts
    players.size
  end

  def teams_winner
    scouts = matches.map(&:winner)
    extract_teams scouts
  end

  def teams_loser
    scouts = matches.map(&:loser)
    extract_teams scouts
  end

  def charts
    @charts ||= Charts::Service.new(matches)
  end

  def players_losers_zero
    scouts = scouts_zero
    extract_players scouts
  end

  def teams_loser_zero
    scouts = scouts_zero
    extract_teams scouts
  end

  def self.decorate(matches)
    new(matches)
  end

  private

  def scouts_zero
    scouts = matches.map(&:loser)
    scouts.select { |s| s.score.zero? }
  end

  def extract_players(scouts)
    players = scouts.flat_map { |s| s.team.players }
    group_and_order players
  end

  def extract_teams(scouts)
    teams = scouts.map(&:team)
    group_and_order teams
  end

  def group_and_order(list)
    grouped = list.group_by(&:id)
    ordered = grouped.map { |_k, v| [v.first.title, v.size] }
    sort_players ordered
  end

  def sort_players(players)
    players.sort_by { |x, y| [-y, x] }
  end
end
