module Database
  def clear_database
    Player.delete_all
    Team.delete_all
    Integrant.delete_all
    Scout.delete_all
    Match.delete_all
  end
end
