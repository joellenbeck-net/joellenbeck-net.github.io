module Kanban
  module Domain
    class TodoTest < TLDR
      def todo
        @todo ||= Todo.new(id:, board_id:)
      end

      def id
        @id ||= 2
      end

      def board_id
        @board_id ||= 1
      end

      def test_delete
        assert_raises(State::InvalidTransition) do
          todo.delete
        end
      end

      def test_cancel
        assert_equal(
          Events::Card::ChangedState.new(
            id:,
            board_id:,
            state: Backlog
          ),
          todo.cancel
        )
      end

      def test_select
        assert_raises(State::InvalidTransition) do
          todo.select
        end
      end

      def test_start
        assert_equal(
          Events::Card::ChangedState.new(
            id:,
            board_id:,
            state: Ongoing
          ),
          todo.start
        )
      end

      def test_finish
        assert_raises(State::InvalidTransition) do
          todo.finish
        end
      end
    end
  end
end
