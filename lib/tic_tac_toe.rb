class TicTacToe

def initialize(board = nil)
  @board = board || Array.new(9," ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board
 puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
 puts "-----------"
 puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
 puts "-----------"
 puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  converted_input = "#{user_input}".to_i - 1
end

def move(converted_input, character)
  @board[converted_input] = character
end

def position_taken?(index)
  position = nil
    if (@board[index] ==  " " || @board[index] == "" || @board[index] == nil)
    position = false
    else
    position = true
    end
    position
end

def valid_move?(index)
move = nil
  if index.between?(0,8) && !position_taken?(index)
    move = true
  else
    move = false
  end
  move
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  converted_input = input_to_index(user_input)
  if valid_move?(converted_input) == true
  move(converted_input, current_player())
  display_board()
  else
    turn()
  end
end


end
