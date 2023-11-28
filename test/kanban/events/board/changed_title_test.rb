require_relative '../../../test_helper'

module Kanban
  module Events
    module Board
      class ChangedTitleTest < TLDR
        def changed_title
          @changed_title ||= ChangedTitle.new(id:, title:)
        end

        def id
          @id ||= 1
        end

        def title
          @title ||= 'A title'
        end

        def test_id
          assert_equal(id, changed_title.id)
        end

        def test_title
          assert_equal(title, changed_title.title)
        end
      end
    end
  end
end
