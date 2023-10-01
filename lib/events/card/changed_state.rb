module Events
  module Card
    class ChangedState < Base::Event
      attr_reader :id, :board_id, :state

      def initialize(id:, board_id:, state:)
        super(id:)
        @board_id = board_id
        @state = state
      end
    end
  end
end
