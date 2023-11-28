require_relative '../../test_helper'

module Kanban
  module Domain
    class TrashTest < TLDR
      def trash
        @trash ||= Trash.new(id:, board_id:)
      end

      def id
        @id ||= 2
      end

      def board_id
        @board_id ||= 1
      end

      def test_delete
        assert_raises(State::InvalidTransition) do
          trash.delete
        end
      end

      def test_cancel
        assert_raises(State::InvalidTransition) do
          trash.cancel
        end
      end

      def test_select
        assert_raises(State::InvalidTransition) do
          trash.select
        end
      end

      def test_start
        assert_raises(State::InvalidTransition) do
          trash.start
        end
      end

      def test_finish
        assert_raises(State::InvalidTransition) do
          trash.finish
        end
      end
    end
  end
end
