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

  def print_triad(coordinates)
    if coordinates[:r][1] == 14
      result = @four_tread
    else
      result = @three_tread
    end
    result = result.split("\n")
    result[coordinates[:r][1]][coordinates[:r][0] * 3] = "R"
    result[coordinates[:t][1]][coordinates[:t][0] * 3] = "3"
    result[coordinates[:f][1]][coordinates[:f][0] * 3] = "5"
    return result
  end
end