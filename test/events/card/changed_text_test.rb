require_relative '../../test_helper'

module Events
  module Card
    class ChangedTextTest < Minitest::Test
      def changed_text
        @changed_text ||= ChangedText.new(id:, board_id:, text:)
      end

      def id
        @id ||= 2
      end

      def board_id
        @board_id ||= 1
      end

      def text
        @text ||= 'A card text'
      end

      def test_id
        assert_equal(id, changed_text.id)
      end

      def test_board_id
        assert_equal(board_id, changed_text.board_id)
      end

      def test_text
        assert_equal(text, changed_text.text)
      end
    end
  end
end
