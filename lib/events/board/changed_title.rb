module Events
  module Board
    class ChangedTitle < Base::Event
      attr_reader :id, :title

      def initialize(id:, title:)
        super(id:)
        @title = title
      end
    end
  end
end
