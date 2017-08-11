class MatchDecorator < Draper::Decorator
  delegate_all

  def players_for_select
    @player_options ||= Player.recents
  end
end
