module Kanban
  module Events
    module Board
      class Deleted < Base::Event
        attr_reader :id
      end
    end
  end
end
