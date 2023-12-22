module Kanban
  module Events
    module Card
      class CreatedTest < TLDR
        def created
          @created ||= Created.new(id:, board_id:, title:, text:, state:)
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

        def text
          @text ||= 'A card text'
        end

        def state
          @state ||= Domain::Backlog
        end

        def test_id
          assert_equal(id, created.id)
        end

        def test_board_id
          assert_equal(board_id, created.board_id)
        end

        def test_title
          assert_equal(title, created.title)
        end

        def test_text
          assert_equal(text, created.text)
        end

        def test_state
          assert_equal(state, created.state)
        end
      end
    end
  end
end
