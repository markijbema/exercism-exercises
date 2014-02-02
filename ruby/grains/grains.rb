class Grains
  # http://en.wikipedia.org/wiki/Wheat_and_chessboard_problem
  NR_OF_SQUARES_ON_CHESSBOARD = 64
  def square nr
    2 ** (nr - 1)
  end

  def total(upto=NR_OF_SQUARES_ON_CHESSBOARD)
    # optimization of geometric series
    square(NR_OF_SQUARES_ON_CHESSBOARD) * 2 - 1
  end
end
