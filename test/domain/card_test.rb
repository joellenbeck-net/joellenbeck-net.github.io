require_relative '../test_helper'

module Domain
  class CardTest < Minitest::Test
    def card
      @card ||= Card.new(id:, board_id:, title:, text:, state:)
    end

    def id
      @id ||= 2
    end

    def board_id
      @board_id ||= 1
    end

    def title
      @title ||= 'A title'
    end

    def other_title
      @other_title ||= 'Another card title'
    end

    def text
      @text ||= 'A text'
    end

    def other_text
      @other_text ||= 'Another card text'
    end

    def state
      return @state unless @state.nil?

      @state = Minitest::Mock.new

      class << @state
        def ==(_other)
          true
        end

        def nil?
          false
        end
      end

      @state
    end

    def test_create
      assert_equal(
        Events::Card::Created.new(id:, title:, text:, state:, board_id:),
        Card.create(id:, title:, text:, state:, board_id:)
      )
    end

    def test_change_title
      assert_equal(
        Events::Card::ChangedTitle.new(
          id:, board_id:, title: other_title
        ),
        card.change_title(other_title)
      )
    end

    def test_change_text
      assert_equal(
        Events::Card::ChangedText.new(
          id:, board_id:, text: other_text
        ),
        card.change_text(other_text)
      )
    end

    def test_delete
      state.expect :delete, nil
      card.delete
    end

    def test_select
      state.expect :select, nil
      card.select
    end

    def test_start
      state.expect :start, nil
      card.start
    end

    def test_finish
      state.expect :finish, nil
      card.finish
    end
  end
end
