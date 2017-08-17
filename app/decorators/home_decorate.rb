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
    scouts  = matches.map(&:scouts).flatten
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

  def self.decorate(matches)
    new(matches)
  end

  private

  def extract_players(scouts)
    players = scouts.map { |s| s.team.players }.flatten
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
