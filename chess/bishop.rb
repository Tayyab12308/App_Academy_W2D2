require_relative 'slideable'
require_relative 'piece'
class Bishop < Piece
  include Slideable

  def move_dirs
    self.diagonal_dirs
  end
end