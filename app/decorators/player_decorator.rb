class PlayerDecorator < Draper::Decorator
  delegate_all

  def total_teams
    @total_teams ||= Player.joins(:integrants).where(id: id).count
  end

  def total_matches
    @total_matches ||= scouts.size
  end

  def total_winner
    @total_winner ||= scouts.select(&:winner?).size
  end

  def total_loser
    @total_loser ||= scouts.select(&:loser?).size
  end

  private

  def scouts
    conditions = 'integrants.player_id = ?'
    @scouts ||= Scout.joins(team: [:integrants]).where(conditions, id)
  end
end
