# frozen_string_literal: true

class GuitarTriad
  attr_reader :top_string, :triad

  def initialize(triad, top_string)
    raise 'Triad must be an instance of Triad' unless triad.instance_of? Triad
    raise 'Top string must be one of 2, 3, 4, 5' unless (2..5).include? top_string.to_i

    @triad = triad
    @top_string = top_string
  end

  def root_string
    case triad.position
    when Triad::ROOT_POSITION
      top_string
    when Triad::FIRST_INVERSION
      top_string - 2
    when Triad::SECOND_INVERSION
      top_string - 1
    else
      raise "Unknown triad position #{triad.position}"
    end
  end

  def third_string
    case triad.position
    when Triad::ROOT_POSITION
      top_string - 1
    when Triad::FIRST_INVERSION
      top_string
    when Triad::SECOND_INVERSION
      top_string - 2
    else
      raise "Unknown triad position #{triad.position}"
    end
  end

  def fifth_string
    case triad.position
    when Triad::ROOT_POSITION
      top_string - 2
    when Triad::FIRST_INVERSION
      top_string - 1
    when Triad::SECOND_INVERSION
      top_string
    else
      raise "Unknown triad position #{triad.position}"
    end
  end

  def play(fretboard)
    fretboard.play_note(root_string, triad.root)
    fretboard.play_note(third_string, triad.third)
    fretboard.play_note(fifth_string, triad.fifth)
  end
end