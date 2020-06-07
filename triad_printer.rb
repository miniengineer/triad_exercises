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
  end

  def convert_y_coordinate(y_coordinate)
    case y_coordinate
    when 0
      return 2
    when 1
      return 6
    when 2
      return 10
    when 3
      return 14
    end
  end

  def print_triad(coordinates)
    if coordinates[:r][1] == 3
      result = @four_tread
    else
      result = @three_tread
    end
    result = result.split("\n")
    r_y = convert_y_coordinate(coordinates[:r][1])
    t_y = convert_y_coordinate(coordinates[:t][1])
    f_y = convert_y_coordinate(coordinates[:f][1])
    result[r_y][coordinates[:r][0] * 3] = "R"
    result[t_y][coordinates[:t][0] * 3] = "3"
    result[f_y][coordinates[:f][0] * 3] = "5"
    return result
  end
end