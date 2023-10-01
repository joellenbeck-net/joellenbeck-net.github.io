require_relative '../../test_helper'

module Events
  module Board
    class DeletedTest < Minitest::Test
      def deleted
        @deleted ||= Deleted.new(id:)
      end

      def id
        @id ||= 1
      end

      def test_id
        assert_equal(id, deleted.id)
      end
    end
  end
end
