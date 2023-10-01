require_relative '../../test_helper'

module Events
  module Card
    class ChangedStateTest < Minitest::Test
      def changed_state
        @changed_state ||= ChangedState.new(id:, board_id:, state:)
      end

      def id
        @id ||= 2
      end

      def board_id
        @board_id ||= 1
      end

      def state
        @state ||= Domain::Todo.new(id:, board_id:)
      end

      def test_id
        assert_equal(id, changed_state.id)
      end

      def test_board_id
        assert_equal(board_id, changed_state.board_id)
      end

      def test_state
        assert_equal(state, changed_state.state)
      end
    end
  end
end
