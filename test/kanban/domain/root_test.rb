require_relative '../../test_helper'

module Kanban
  module Domain
    class RootTest < TLDR
      def id
        @id ||= 1
      end

      def title
        @title ||= 'A board title'
      end

      def another_title
        @another_title ||= 'Another board title'
      end

      def test_create_board
        root = Root.new

        assert_equal(
          Events::Board::Created.new(id:, title:),
          root.create_board(id:, title:)
        )
      end

      def test_create_board_when_the_same_board_already_exists
        root = Root.new(boards: [Board.new(id:, title:)])

        assert_raises(Root::BoardAlreadyExists) do
          root.create_board(id:, title: another_title)
        end
      end
    end
  end
end
