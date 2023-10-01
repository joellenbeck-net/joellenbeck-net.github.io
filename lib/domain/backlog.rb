module Domain
  class Backlog < State
    def delete
      Events::Card::ChangedState.new(
        id:, board_id:, state: Trash
      )
    end

    def select
      Events::Card::ChangedState.new(
        id:, board_id:, state: Todo
      )
    end
  end
end
