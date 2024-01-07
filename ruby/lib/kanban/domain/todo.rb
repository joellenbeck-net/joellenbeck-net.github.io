module Kanban
  module Domain
    class Todo < State
      def cancel
        Events::Card::ChangedState.new(
          id:, board_id:, state: Backlog
        )
      end

      def start
        Events::Card::ChangedState.new(
          id:, board_id:, state: Ongoing
        )
      end
    end
  end
end
