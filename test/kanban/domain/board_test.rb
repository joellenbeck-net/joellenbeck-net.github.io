require_relative '../../test_helper'

module Kanban
  module Domain
    class BoardTest < Minitest::Test
      def board
        @board ||= Board.new(id:, title:)
      end

      def id
        @id ||= 1
      end

      def title
        @title ||= 'A board title'
      end

      def other_title
        @other_title ||= 'Another board title'
      end

      def test_change_title
        assert_equal(
          Events::Board::ChangedTitle.new(
            id:, title: other_title
          ),
          board.change_title(other_title)
        )
      end
    end
  end
end
