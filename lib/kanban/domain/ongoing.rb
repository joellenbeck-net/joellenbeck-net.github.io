module Kanban
  module Domain
    class Ongoing < State
      def cancel
        Events::Card::ChangedState.new(
          id:, board_id:, state: Backlog
        )
      end

      def finish
        Events::Card::ChangedState.new(
          id:, board_id:, state: Done
        )
      end
    end
  end
end
