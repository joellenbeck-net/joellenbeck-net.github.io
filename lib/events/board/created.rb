module Events
  module Board
    class Created < Base::Event
      attr_reader :id, :title

      def initialize(id:, title:)
        super(id:)
        @title = title
      end
    end
  end
end
