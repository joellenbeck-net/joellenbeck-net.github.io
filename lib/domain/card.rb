module Domain
  class Card
    def self.create(id:, title:, text:, state:, board_id:)
      Events::Card::Created.new(id:, title:, text:, state:, board_id:)
    end

    def initialize(id:, title:, text:, state:, board_id:)
      @id = id
      @title = title
      @text = text
      @state = state
      @board_id = board_id
    end

    def change_title(title)
      Events::Card::ChangedTitle.new(id: @id, board_id: @board_id, title:)
    end

    def change_text(text)
      Events::Card::ChangedText.new(id: @id, board_id: @board_id, text:)
    end

    def deleted?
      @state.is_a?(Trash)
    end

    def delete
      @state.delete
    end

    def select
      @state.select
    end

    def start
      @state.start
    end

    def finish
      @state.finish
    end
  end
end
