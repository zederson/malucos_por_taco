def time_finished
  Time.zone.now + 25.minutes
end

FactoryGirl.define do
  factory :match do
    started_at Time.zone.now
    finished_at time_finished
  end

  factory :complete_match, class: Match do
    started_at Time.zone.now
    finished_at time_finished

    after(:create) do |match_created, _evaluator|
      first_team  = create(:team)
      second_team = create(:team)

      create_list(:integrant, 2, team: first_team)
      create_list(:integrant, 2, team: second_team)

      create(:scout, match: match_created, team: first_team)
      create(:scout, match: match_created, team: second_team, run: 2)
    end
  end
end
