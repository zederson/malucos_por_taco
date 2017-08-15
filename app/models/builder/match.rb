module Builder
  class Match
    class << self
      def build_match
        ::Match.new.tap do |m|
          build_scount m
        end
      end

      private

      def build_scount(match)
        2.times { match.scouts.build }
        match.scouts.each do |scout|
          scout.build_team
          2.times { scout.team.players.build }
        end
      end
    end
  end
end
