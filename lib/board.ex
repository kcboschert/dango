defmodule Dango.Board do
  def new(size) do
    for _ <- 1..size, do: make_row(size)
  end

  def place_stone(board, :white, row, col) do
    place_stone(board, -1, row, col)
  end

  def place_stone(board, :black, row, col) do
    place_stone(board, 1, row, col)
  end

  def place_stone(board, value, row, col) do
    new_row = Enum.at(board,row)
    |> List.replace_at(col-1,value)

    board
    |> List.replace_at(row-1, new_row)
  end

  def format_board(board) do
    row_label_size = row_label_size(board)
    num_columns = Enum.count(Enum.at(board,0))

    board_with_row_numbers = board_with_row_numbers(board, row_label_size)
    row_label_buffer = String.duplicate(" ", row_label_size)
    column_labels = column_labels(num_columns)
    header_footer = row_label_buffer <> column_labels <> row_label_buffer <> "\n"

    header_footer
    <> board_with_row_numbers
    <> header_footer
  end

  defp row_label_size(board) do
    Enum.count(board)
    |> Integer.to_string
    |> String.length
  end

  defp board_with_row_numbers(board, row_label_size) do
    Enum.map(Enum.with_index(board), fn({row, num}) -> format_row(row, Integer.to_string(num+1), row_label_size) end)
    |> Enum.into("")
  end

  defp column_labels(num_columns) do
    Enum.to_list(?A .. ?Z)
    |> List.to_string
    |> String.slice(0,num_columns)
  end

  defp format_row(row, num, row_label_size) do
    row_string = Enum.map(row, &format_point/1)
    |> Enum.into("")

    String.rjust(num, row_label_size) <> row_string <> String.ljust(num, row_label_size) <> "\n"
  end

  defp format_point(point) do
    case point do
      -1 -> "\e37mO"
      1 -> "\e30mO"
      _ -> "+"
    end
  end

  defp make_row(length) do
    for _ <- 1..length, do: 0
  end
end
