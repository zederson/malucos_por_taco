class Match
  class SearchService
    class << self
      def by_started(start)
        query = Match.recents.includes(scouts: [team: [:players]])
        query = add_condition(query, start) if start.present?
        query.all
      end

      private

      def add_condition(relation, start)
        date = parse_date start
        params = date.beginning_of_day, date.end_of_day
        relation.where('started_at BETWEEN ? AND ? ', *params)
      end

      def parse_date(started)
        Time.zone.parse(started)
      end
    end
  end
end
