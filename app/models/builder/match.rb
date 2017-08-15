module Builder
  class Match
    def self.build_match
      ::Match.new.tap do |m|
        build_scount m
      end
    end

    private

    def self.build_scount(match)
      2.times { match.scouts.build }
      match.scouts.each do |scout|
        scout.build_team
        2.times { scout.team.players.build }
      end
    end
  end
end
