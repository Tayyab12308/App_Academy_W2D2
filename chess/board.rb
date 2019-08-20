require_relative "piece"
require_relative "nullpiece"
require_relative "rook"
require_relative "knight"
require_relative "bishop"
require_relative "queen"
require_relative "king"
require_relative "pawn"
require 'byebug'
class Board
  attr_reader :board

  class NoPieceInPosition < StandardError
    def message
      "There is no piece in that position"
    end
  end 
  class PieceAlreadyInPosition < StandardError
    def message
      "There is already a piece in that position"
    end
  end
  class OffBoardPosition < StandardError
    def message
      "The place you are trying to move is off the board"
    end
  end 

  def populate_board
    board[0][0] = Rook.new("R", self, [0,0]) # how do we use reference our objects
    board[0][1] = Knight.new("k", self, [0,1])  
    board[0][2] = Bishop.new("B", self, [0,2])
    board[0][3] = Queen.new("Q", self, [0,3])
    board[0][4] = King.new("K", self, [0,4])
    board[0][5] = Bishop.new("B", self, [0,5])
    board[0][6] = Knight.new("k", self, [0,6])
    board[0][7] = Rook.new("R", self, [0,7])

    board[1][0] = Pawn.new("P", self, [1, 0])
    board[1][1] = Pawn.new("P", self, [1, 1])
    board[1][2] = Pawn.new("P", self, [1, 2])
    board[1][3] = Pawn.new("P", self, [1, 3])
    board[1][4] = Pawn.new("P", self, [1, 4])
    board[1][5] = Pawn.new("P", self, [1, 5])
    board[1][6] = Pawn.new("P", self, [1, 6])
    board[1][7] = Pawn.new("P", self, [1, 7])
    
    board[7][0] = Rook.new("R", self, [7,0])
    board[7][1] = Knight.new("k", self, [7,1])
    board[7][2] = Bishop.new("B", self, [7,2])
    board[7][3] = Queen.new("Q", self, [7,3])
    board[7][4] = King.new("K", self, [7,4])
    board[7][5] = Bishop.new("B", self, [7,5])
    board[7][6] = Knight.new("k", self, [7,6])
    board[7][7] = Rook.new("R", self, [7,7])

    board[6][0] = Pawn.new("P", self, [6, 0])
    board[6][1] = Pawn.new("P", self, [6, 1])
    board[6][2] = Pawn.new("P", self, [6, 2])
    board[6][3] = Pawn.new("P", self, [6, 3])
    board[6][4] = Pawn.new("P", self, [6, 4])
    board[6][5] = Pawn.new("P", self, [6, 5])
    board[6][6] = Pawn.new("P", self, [6, 6])
    board[6][7] = Pawn.new("P", self, [6, 7])
  end

  def initialize
    @singleton = NullPiece.instance 
    @board = Array.new(8) { Array.new(8, @singleton) }
    self.populate_board 
  end

  def move_piece(start_pos, end_pos)
    # debugger
    begin
      # debugger
      if self[start_pos] == nil
        # debugger
        raise NoPieceInPosition
      elsif end_pos.any? { |el| el > 7 || el < 0 }
      # debugger
        raise OffBoardPosition 
      elsif !self[end_pos].is_a?(NullPiece)
        # debugger
        raise PieceAlreadyInPosition     
      end 
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    rescue NoPieceInPosition => e
      puts e.message
    rescue PieceAlreadyInPosition => e
      puts e.message
    rescue OffBoardPosition => e
      puts e.message
    end 

  end

  def [](pos)
    # debugger
    row, col = pos
    # debugger 
    board[row][col] 
    # debugger
  end
  
  def []=(pos, val) 
    row, col = pos
    board[row][col] = val 
  end 

    def display
    a = board.map.with_index do |el, i|
      board.map.with_index do |el, i2|
        @board[i][i2].color 
      end
    end
    a.each do |level|
      puts level.join(" ")
    end
  end

end

a = Board.new
a.display
a.move_piece([0,0], [3, 3])
puts "=============="
a.display
a.move_piece([3, 3], [1, 1])