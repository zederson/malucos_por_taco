class MatchDecorator < Draper::Decorator
  delegate_all

  def players_for_select
    @player_options ||= Player.recents
  end

  def title_for_first_team
    h.content_tag :div do
      h.concat(h.content_tag(:i, '', class: 'fa fa-trophy text-success')) if winner?(scouts.first)
      h.concat(title_for_teams :first)
    end
  end

  def title_for_second_team
    h.content_tag :div do
      h.concat(h.content_tag(:i, ' ', class: 'fa fa-trophy text-success')) if winner?(scouts.last)
      h.concat(title_for_teams :last)
    end
  end

  def scout_first_team
    scouts.first
  end

  def scout_second_team
    scouts.last
  end

  def score_first_team
    "%02d" % scout_first_team.score
  end

  def score_second_team
    "%02d" % scout_second_team.score
  end

  private

  def title_for_teams(trigger)
    players = scouts.send(trigger).team.players
    titles  = players.map { |p| p.title }
    titles.join ' - '
  end
end
