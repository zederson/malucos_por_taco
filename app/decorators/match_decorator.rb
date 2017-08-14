class MatchDecorator < Draper::Decorator
  delegate_all

  def players_for_select
    @player_options ||= Player.recents
  end

  def title_for_first_team
    build_title_for_team :first
  end

  def title_for_second_team
    build_title_for_team :last
  end

  def scout_first_team
    scouts.first
  end

  def scout_second_team
    scouts.last
  end

  def score_first_team
    format('%02d', scout_first_team.score)
  end

  def score_second_team
    format('%02d', scout_second_team.score)
  end

  private

  def build_title_for_team(trigger)
    h.content_tag :div do
      h.concat(h.content_tag(:i, '', class: 'fa fa-trophy text-success')) if winner?(scouts.send(trigger))
      h.concat(title_for_teams(trigger))
    end
  end

  def title_for_teams(trigger)
    players = scouts.send(trigger).team.players
    titles  = players.map(&:title)
    titles.join ' - '
  end
end
