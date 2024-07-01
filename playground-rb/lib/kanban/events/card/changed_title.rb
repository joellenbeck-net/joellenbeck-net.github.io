module Kanban
  module Events
    module Card
      class ChangedTitle < Base::Event
        attr_reader :id, :board_id, :title

        def initialize(id:, board_id:, title:)
          super(id:)
          @board_id = board_id
          @title = title
        end
      end
    end
  end
end
