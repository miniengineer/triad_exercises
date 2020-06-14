class Printer
  attr_reader :result, :fretboard

  def initialize(fretboard)
    @fretboard = fretboard
    @result = print_fret
  end

  def print_fret
    fret = []
    (fretboard.highest_played_fret - fretboard.lowest_played_fret + 1).times do
      draw(fret)
    end
    fret << '----------------'
  end

  def convert_y_coordinate(y_coordinate)
    y_coordinate = y_coordinate - fretboard.lowest_played_fret + 1
    case y_coordinate
    when 1
      2
    else
      2 + (y_coordinate - 1) * 4
    end
  end

  def convert_x_coordinate(x_coordinate)
    case x_coordinate
    when 0
      0
    else
      x_coordinate * 3
    end
  end

  def print_notes
    fretboard.played_frets.each_with_index do |fret_num, string_num|
      next if fret_num.nil?

      y_c = convert_y_coordinate(fret_num)
      x_c = convert_x_coordinate(string_num)
      fret_num -= 12 if fret_num > 11
      note = fretboard.strings[string_num][fret_num]
      result[y_c][x_c] = note
      result[y_c].slice!(x_c + 2) if note.length > 1
    end

    result.each(&:reverse!)

    fretboard.fret_labels.each do |fret_num, label|
      y_c = convert_y_coordinate(fret_num)
      result[y_c] = "#{result[y_c]}  #{label}"
    end

    result
  end

  private

  def draw(fret)
    fret << '----------------'
    3.times do
      fret << '|  |  |  |  |  |'
    end
  end
end

# ----------------
# |  |  |  |  |  |
# |  |  |  |  |  |
# |  |  |  |  |  |
# ----------------
# |  |  |  |  |  |
# |  |  |  |  |  |
# |  |  |  |  |  |
# ----------------
# |  |  |  |  |  |
# |  |  |  |  |  |
# |  |  |  |  |  |
# ----------------
# |  |  |  |  |  |
# |  |  |  |  |  |
# |  |  |  |  |  |
# ----------------
# |  |  |  |  |  |
# |  |  |  |  |  |
# |  |  |  |  |  |
# ----------------
# |  |  |  |  |  |
# |  |  |  |  |  |
# |  |  |  |  |  |
# ----------------
# |  |  |  |  |  |
# |  |  |  |  |  |
# |  |  |  |  |  |
# ----------------
# |  |  |  |  |  |
# |  |  |  |  |  |
# |  |  |  |  |  |
# ----------------
# |  |  |  |  |  |
# |  |  |  |  |  |
# |  |  |  |  |  |
# ----------------
# |  |  |  |  |  |
# |  |  C  |  |  |
# |  |  |  |  |  |
# ----------------
# |  |  |  |  |  |
# |  |  |  |  |  |
# |  |  |  |  |  |
# ----------------
# |  |  |  |  |  |
# |  A  |  |  |  |
# |  |  |  |  |  |
# ----------------
# |  |  |  |  |  |
# F  |  |  |  |  |
# |  |  |  |  |  |
# ----------------
