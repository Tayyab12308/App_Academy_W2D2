require 'byebug'
module Slideable

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS 
  end

  def moves 
    x, y = self.pos
    all_moves = grow_unblocked_moves_in(x, y)
  end

  private
  
  HORIZONTAL_DIRS = [[0, 1], [1, 0], [-1, 0], [0, -1]]
  
  DIAGONAL_DIRS = [[1, 1], [1, -1], [-1, 1], [-1, -1]]

  def move_dirs
    raise ""
  end
  def decide_dirs(x, y)
    pos = [x, y]
    if board[pos].is_a?(Rook)
      return HORIZONTAL_DIRS
    elsif board[pos].is_a?(Bishop)
      return DIAGONAL_DIRS
    elsif board[pos].is_a?(Queen)
      return HORIZONTAL_DIRS + DIAGONAL_DIRS
    end
  end

  def grow_unblocked_moves_in(dx, dy) 
    all_unblocked = []
    dir_to_move = decide_dirs(dx, dy)
    dir_to_move.each do |sub_dir|
      move = [ dx, dy ] 
      loop do
        x, y = move
        x_dir = sub_dir[0] + x
        y_dir = sub_dir[1] + y
        new_pos = [ x_dir, y_dir ] 
        break if new_pos.any? { |el| el < 0 || el > 7 } 
        break if !board[new_pos].is_a?(NullPiece)
        all_unblocked << new_pos
        move = new_pos
      end 
    end
    all_unblocked
  end

end