module Kanban
  module Events
    module Card
      class ChangedText < Base::Event
        attr_reader :id, :board_id, :text

        def initialize(id:, board_id:, text:)
          super(id:)
          @board_id = board_id
          @text = text
        end
      end
    end
  end
end
