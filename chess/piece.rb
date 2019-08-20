class Piece

  attr_reader :pos, :board, :color
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos 
  end

  def move
    
  
  end
   
  def [](pos)
    # debugger
    row, col = pos
    # debugger 
    @board[row][col] 
    # debugger
  end
  
  def []=(pos, val) 
    row, col = pos
    @board[row][col] = val 
  end 


end