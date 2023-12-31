module Kanban
  module Events
    module Board
      class DeletedTest < TLDR
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
end
