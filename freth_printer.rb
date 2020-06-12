# frozen_string_literal: true

class FretPrinter
  attr_reader :fret

  def initialize(max_fret_number)
    @fret = print_fret(max_fret_number)
  end

  def print_fret(max_fret_number)
    fret = ''
    while max_fret_number.positive?
      fret += '----------------'
      3.times do
        fret += "\n|  |  |  |  |  |"
      end
      fret += "\n"
      max_fret_number -= 1
    end
    fret + '----------------'
  end
end

