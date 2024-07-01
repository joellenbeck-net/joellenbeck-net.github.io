module Kanban
  module Domain
    class DoneTest < TLDR
      def done
        @done ||= Done.new(id:, board_id:)
      end

      def id
        @id ||= 2
      end

      def board_id
        @board_id ||= 1
      end

      def test_delete
        assert_raises(State::InvalidTransition) do
          done.delete
        end
      end

      def test_cancel
        assert_raises(State::InvalidTransition) do
          done.cancel
        end
      end

      def test_select
        assert_raises(State::InvalidTransition) do
          done.select
        end
      end

      def test_start
        assert_raises(State::InvalidTransition) do
          done.start
        end
      end

      def test_finish
        assert_raises(State::InvalidTransition) do
          done.finish
        end
      end
    end
  end
end
