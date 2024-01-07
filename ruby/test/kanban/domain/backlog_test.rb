module Kanban
  module Domain
    class BacklogTest < TLDR
      def backlog
        @backlog ||= Backlog.new(id:, board_id:)
      end

      def id
        @id ||= 2
      end

      def board_id
        @board_id ||= 1
      end

      def test_delete
        assert_equal(
          Events::Card::ChangedState.new(
            id:,
            board_id:,
            state: Trash
          ),
          backlog.delete
        )
      end

      def test_cancel
        assert_raises(State::InvalidTransition) do
          backlog.cancel
        end
      end

      def test_select
        assert_equal(
          Events::Card::ChangedState.new(
            id:,
            board_id:,
            state: Todo
          ),
          backlog.select
        )
      end

      def test_start
        assert_raises(State::InvalidTransition) do
          backlog.start
        end
      end

      def test_finish
        assert_raises(State::InvalidTransition) do
          backlog.finish
        end
      end
    end
  end
end
