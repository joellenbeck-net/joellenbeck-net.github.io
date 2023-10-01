module Kanban
  module Domain
    class Board
      def initialize(id:, title:)
        @id = id
        @title = title
      end

      attr_reader :id, :title

      def change_title(title)
        Events::Board::ChangedTitle.new(id:, title:)
      end

      def delete; end
    end
  end
end
