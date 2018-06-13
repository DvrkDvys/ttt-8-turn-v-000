
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(user_input)
  adjusted_input = user_input.to_i - 1
  return adjusted_input
end


def valid_move?(board, index)
    if (index > 8 || index < 0 || index % 1 != 0 || position_taken?(board, index) == true)
      false
    else true
  end
end


def position_taken?(board, index)
    if (board[index] == "" || board[index] == " " || board[index] == nil)
      false
    else true
  end
end


def update_array_at_with(board, adjusted_input, user = "X")
  board[adjusted_input] = user
  return board
end

def move(board, adjusted_input, user = "X")
  modified_board = update_array_at_with(board, adjusted_input, user)
  display_board(modified_board)
end

def turn(board)
  puts "Please enter 1-9:"

  move(board, adjusted_input, user = "X")
end

    it 'gets the user input' do
      board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      allow($stdout).to receive(:puts)

      expect(self).to receive(:gets).and_return("1")

      turn(board)
    end

    it 'calls the input_to_index method' do
      board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      allow($stdout).to receive(:puts)

      allow(self).to receive(:gets).and_return("1")

      expect(self).to receive(:input_to_index).and_call_original

      turn(board)
    end



