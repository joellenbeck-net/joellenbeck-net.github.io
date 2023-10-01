module Kanban
  module Events
    module Card
      class Created < Base::Event
        attr_reader :id, :board_id, :title, :text, :state

        def initialize(id:, board_id:, title:, text:, state:)
          super(id:)
          @board_id = board_id
          @title = title
          @text = text
          @state = state
        end
      end
    end
  end
end
