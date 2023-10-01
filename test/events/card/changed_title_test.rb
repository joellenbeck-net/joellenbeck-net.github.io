require_relative '../../test_helper'

module Events
  module Card
    class ChangedTitleTest < Minitest::Test
      def changed_title
        @changed_title ||= ChangedTitle.new(id:, board_id:, title:)
      end

      def id
        @id ||= 2
      end

      def board_id
        @board_id ||= 1
      end

      def title
        @title ||= 'A card title'
      end

      def test_id
        assert_equal(id, changed_title.id)
      end

      def test_board_id
        assert_equal(board_id, changed_title.board_id)
      end

      def test_title
        assert_equal(title, changed_title.title)
      end
    end
  end
end
