# frozen_string_literal: true

class TriadPrinter
  def initialize
    @three_tread = "----------------
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
----------------
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
----------------
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
----------------"
    @four_tread = "----------------
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
----------------
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
----------------
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
----------------
|  |  |  |  |  |
|  |  |  |  |  |
|  |  |  |  |  |
----------------"
    @strings = [
      ['E', 'F', '', 'G', '', 'A', '', 'B', 'C', '', 'D', '', 'E'],
      ['A', '', 'B', 'C', '', 'D', '', 'E', 'F', '', 'G', '', 'A'],
      ['D', '', 'E', 'F', '', 'G', '', 'A', '', 'B', 'C', '', 'D'],
      ['G', '', 'A', '', 'B', 'C', '', 'D', '', 'E', 'F', '', 'G'],
      ['B', 'C', '', 'D', '', 'E', 'F', '', 'G', '', 'A', '', 'B'],
      ['E', 'F', '', 'G', '', 'A', '', 'B', 'C', '', 'D', '', 'E']
    ]
  end

  def convert_y_coordinate(y_coordinate)
    case y_coordinate
    when 0
      2
    when 1
      6
    when 2
      10
    when 3
      14
    end
  end

  def fret_printer(coordinates, note)
    fret = @strings[coordinates[:r][0]].index(note)
    if fret < coordinates[:r][1] - [coordinates[:t][1], coordinates[:f][1]].min
      fret += 12
    end
    fret
  end

  def print_triad(coordinates)
    result = if coordinates[:r][1] == 3
               @four_tread
             else
               @three_tread
             end
    result = result.split("\n")
    r_y = convert_y_coordinate(coordinates[:r][1])
    t_y = convert_y_coordinate(coordinates[:t][1])
    f_y = convert_y_coordinate(coordinates[:f][1])
    result[r_y][coordinates[:r][0] * 3] = 'R'
    result[t_y][coordinates[:t][0] * 3] = '3'
    result[f_y][coordinates[:f][0] * 3] = '5'
    result
  end

  def result_printer(coordinates, note)
    result = print_triad(coordinates)
    fret = fret_printer(coordinates, note)
    r_y = convert_y_coordinate(coordinates[:r][1])
    result[r_y] += "         Fret number: #{fret}"
    result
  end
end
