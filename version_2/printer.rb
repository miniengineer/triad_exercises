# frozen_string_literal: true

class Printer
  attr_reader :fret

  def initialize(fretboard)
    @fret = print_fret(fretboard)
  end

  def print_fret(fretboard)
    fret = []
    while fretboard.max_fret.positive?
      fret << '----------------'
      3.times do
        fret << '|  |  |  |  |  |'
      end
      fretboard.max_fret -= 1
    end
    fret << '----------------'
  end

  def convert_y_coordinate(y_coordinate)
    case y_coordinate
    when 0
      2
    else
      y_coordinate *= 4
      y_coordinate + 2
    end
  end

  def print_notes(fretboard)
    fretboard.played_frets.each_with_index do |fret_num, string_num|
      fret[convert_y_coordinate(fret_num)][string_num] = fretboard.fret[string_num][fret_num]
    end
    fret
  end
end
