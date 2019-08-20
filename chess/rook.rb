require_relative 'slideable'
require_relative 'piece'
class Rook < Piece
  include Slideable

  def move_dirs
    self.horizontal_dirs
  end
end