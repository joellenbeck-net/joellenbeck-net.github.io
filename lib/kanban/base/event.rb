module Kanban
  module Base
    class Event
      include Value

      def initialize(id:)
        @id = id
      end
    end
  end
end
