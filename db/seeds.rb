def create_match(start, finish)
  Match.create(started_at: start, finished_at: finish)
end

def create_team(first, second)
  p1 = Player.find_by_nick_name(first)
  p2 = Player.find_by_nick_name(second)
  service = Team::CreatorService.new(p1, p2)
  service.load_or_create
end

def create_scout(first_player, second_player, match, run, back, lost_ball, bat_delivery, house, burned, victory, concierge)
  team  = create_team(first_player, second_player)
  values = {
    team:          team,
    match:         match,
    run:           run,
    back:          back,
    lost_ball:     lost_ball,
    bat_delivery:  bat_delivery,
    house:         house,
    burned:        burned,
    victory:       victory,
    concierge:     concierge
  }
  Scout.create(values)
  puts "Created -#{match.started_at} - #{first_player} - #{second_player}"
end

players_names = [
  ['Ederson de Lima', 'Zé'],
  ['Marco Aurélio', 'Marco'],
  ['Felipe Venezian', 'Felipe'],
  ['Anselmo', 'Anselmo'],
  ['Ronaldo', 'Cá'],
  ['Rogério', 'Rogério'],
  ['Sidnei', 'Sinfonia'],
  ['Fábio Lima', 'Fábio'],
  ['Vando', 'Vando'],
  ['Adriano', 'Adriano'],
  ['Matheus', 'Matheus'],
  ['Anderson', 'Tacudo']
]

ActiveRecord::Base.transaction do

  players_names.each do |values|
    Player.create(name: values.first, nick_name: values.last) unless Player.find_by_name(values.first)
  end

  # 05/08/2017
  match = create_match(Time.new(2017, 8, 5, 9, 10), Time.new(2017, 8, 5, 9, 23))
  create_scout('Zé', 'Marco', match, 13, 2, 0, 0, 1, 0, 0, 0)
  create_scout('Vando', 'Tacudo', match, 0, 0, 0, 0, 0, 0, 0, 0)

  match = create_match(Time.new(2017, 8, 5, 9, 25), Time.new(2017, 8, 5, 10, 0))
  create_scout('Zé', 'Marco', match, 13, 2, 0, 1, 1, 0, 0, 1)
  create_scout('Anselmo', 'Tacudo', match, 9, 6, 0, 0, 2, 0, 0, 5)

  match = create_match(Time.new(2017, 8, 5, 10, 10), Time.new(2017, 8, 5, 10, 55))
  create_scout('Zé', 'Marco', match, 13, 5, 0, 0, 2, 0, 0, 2)
  create_scout('Felipe', 'Vando', match, 8, 7, 0, 0, 2, 0, 0, 0)

  match = create_match(Time.new(2017, 8, 5, 9, 0), Time.new(2017, 8, 5, 9, 0))
  create_scout('Zé', 'Marco', match, 7, 3, 0, 0, 1, 0, 0, 0)
  create_scout('Adriano', 'Tacudo', match, 4, 2, 0, 0, 2, 0, 0, 1)

  match = create_match(Time.new(2017, 8, 5, 9, 0), Time.new(2017, 8, 5, 9, 0))
  create_scout('Zé', 'Marco', match, 3, 0, 0, 0, 0, 1, 0, 2)
  create_scout('Felipe', 'Anselmo', match, 7, 0, 0, 1, 0, 1, 0, 1)

  match = create_match(Time.new(2017, 8, 5, 9, 0), Time.new(2017, 8, 5, 9, 0))
  create_scout('Felipe', 'Anselmo', match, 7, 0, 0, 0, 0, 0, 0, 0)
  create_scout('Vando', 'Tacudo', match, 0, 0, 0, 0, 0, 0, 0, 0)

  match = create_match(Time.new(2017, 8, 5, 11, 40), Time.new(2017, 8, 5, 12, 12))
  create_scout('Felipe', 'Anselmo', match, 13, 3, 1, 0, 0, 0, 0, 0)
  create_scout('Adriano', 'Zé', match, 10, 3, 1, 0, 0, 0, 0, 0)

  match = create_match(Time.new(2017, 8, 5, 12, 20), Time.new(2017, 8, 5, 13, 00))
  create_scout('Felipe', 'Anselmo', match, 13, 10, 0, 0, 2, 1, 0, 1)
  create_scout('Adriano', 'Marco', match, 6, 8, 0, 0, 0, 1, 1, 2)


  # 22/06/2013
  start  = Time.new(2013, 6, 22, 9)
  finish = Time.new(2013, 6, 22, 9)

  match = create_match(start, finish)
  create_scout('Anselmo', 'Matheus', match, 7, 2, 1, 7, 2, 4, 0, 0)
  create_scout('Fábio', 'Felipe', match, 13, 2, 0, 6, 3, 2, 2, 0)

  match = create_match(start, finish)
  create_scout('Marco', 'Zé',     match, 2, 3, 0, 1, 1, 0, 0, 0)
  create_scout('Fábio', 'Felipe', match, 13, 1, 0, 1, 0, 0, 0, 0)

  match = create_match(start, finish)
  create_scout('Anselmo', 'Matheus', match, 0, 0, 0, 0, 0 ,0 ,0, 0)
  create_scout('Fábio', 'Felipe',    match, 13, 1, 0, 0, 0 ,0 ,0, 0)

  match = create_match(start, finish)
  create_scout('Marco', 'Zé',       match, 13, 2, 0, 0, 0, 0, 1, 0)
  create_scout('Anselmo', 'Felipe', match, 0, 0, 0, 1, 0, 0, 0, 0)

  match = create_match(start, finish)
  create_scout('Marco', 'Zé',       match, 12, 9, 2, 3, 1, 0, 0, 0)
  create_scout('Matheus', 'Felipe', match, 13, 3, 0, 2, 0, 0, 0, 0)
end
# run, back, lost_ball, bat_delivery, house, burned, victory, concierge

def delete_all
  Player.delete_all
  Team.delete_all
  Integrant.delete_all
  Scout.delete_all
  Match.delete_all
end
