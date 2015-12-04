defmodule BoardTest do
  use ExUnit.Case
  doctest Dango.Board

  alias Dango.Board

  test "new/1 returns correctly-sized blank board" do
    assert Board.new(9) == [
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
    ]
  end

  test "place_stone/4 places white stone in specified space" do
    board = Board.new(3)
    assert Board.place_stone(board, :white, 2, 2) == [
      [0, 0, 0],
      [0, -1, 0],
      [0, 0, 0],
    ]
  end

  test "place_stone/4 places black stone in specified space" do
    board = Board.new(3)
    assert Board.place_stone(board, :black, 2, 2) == [
      [0, 0, 0],
      [0, 1, 0],
      [0, 0, 0],
    ]
  end

  test "format_board/1 displays the board correctly for black stones" do
    board = Board.place_stone(Board.new(3), :black, 2, 2)
    assert Board.format_board(board) == " ABC \n1+++1\n2+\e30mO+2\n3+++3\n ABC \n"
  end

  test "format_board/1 displays the board correctly for white stones" do
    board = Board.place_stone(Board.new(3), :white, 2, 2)
    assert Board.format_board(board) == " ABC \n1+++1\n2+\e37mO+2\n3+++3\n ABC \n"
  end
end
