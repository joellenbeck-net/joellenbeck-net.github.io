require_relative '../../../test_helper'

module Kanban
  module Events
    module Board
      class CreatedTest < TLDR
        def created
          Created.new(id:, title:)
        end

        def id
          @id ||= 1
        end

        def title
          @title ||= 'A title'
        end

        def test_id
          assert_equal(id, created.id)
        end

        def test_title
          assert_equal(title, created.title)
        end
      end
    end
  end
end
