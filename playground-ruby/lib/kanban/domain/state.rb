module Kanban
  module Domain
    class State
      class InvalidTransition < StandardError
      end

      include Base::Value

      attr_reader :id, :board_id

      def initialize(id:, board_id:)
        @id = id
        @board_id = board_id
      end

      def delete
        raise InvalidTransition
      end

      def cancel
        raise InvalidTransition
      end

      def select
        raise InvalidTransition
      end

      def start
        raise InvalidTransition
      end

      def finish
        raise InvalidTransition
      end
    end
  end
end
