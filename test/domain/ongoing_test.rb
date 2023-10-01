require_relative '../test_helper'

module Domain
  class OngoingTest < Minitest::Test
    def ongoing
      @ongoing ||= Ongoing.new(id:, board_id:)
    end

    def id
      @id ||= 2
    end

    def board_id
      @board_id ||= 1
    end

    def test_delete
      assert_raises(State::InvalidTransition) do
        ongoing.delete
      end
    end

    def test_cancel
      assert_equal(
        Events::Card::ChangedState.new(
          id:,
          board_id:,
          state: Backlog
        ),
        ongoing.cancel
      )
    end

    def test_select
      assert_raises(State::InvalidTransition) do
        ongoing.select
      end
    end

    def test_start
      assert_raises(State::InvalidTransition) do
        ongoing.start
      end
    end

    def test_finish
      assert_equal(
        Events::Card::ChangedState.new(
          id:,
          board_id:,
          state: Done
        ),
        ongoing.finish
      )
    end
  end
end
