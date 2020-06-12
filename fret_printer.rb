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

  def add_triad(gt)
    case gt.triad.position
    when Triad::ROOT_POSITION
      add_note string, gt.triad.root
      add_note string + 1, gt.triad.third
      add_note string + 2, gt.triad.fifth
    when Triad::FIRST_INVERSION
      add_note string, gt.triad.third
      add_note string + 1, gt.triad.fifth
      add_note string + 2, gt.triad.root
    when Triad::SECOND_INVERSION
      add_note string, gt.triad.fifth
      add_note string + 1, gt.triad.root
      add_note string + 2, gt.triad.third
    end
  end
end
