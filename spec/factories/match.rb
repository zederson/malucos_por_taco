FactoryGirl.define do
  factory :match do
    started_at Time.zone.now
    finished_at (Time.zone.now + 25.minutes)
  end

  factory :complete_match, class: Match do
    started_at Time.zone.now
    finished_at (Time.zone.now + 25.minutes)

    after(:create) do |match_created, evaluator|
      first_team  = create(:team)
      second_team = create(:team)

      create_list(:integrant, 2, team: first_team)
      create_list(:integrant, 2, team: second_team)

      create(:scout, match: match_created, team: first_team)
      create(:scout, match: match_created, team: second_team, run: 6)
    end
  end
end