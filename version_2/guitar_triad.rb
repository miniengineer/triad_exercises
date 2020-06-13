# frozen_string_literal: true

class GuitarTriad
  attr_reader :top_string, :triad

  def initialize(triad, top_string)
    raise 'Triad must be an instance of Triad' unless triad instance_of? Triad

    raise 'Top string must be one of 1, 2, 3, 4' unless (1..4).include? top_string.to_i

    @triad = triad
    @top_string = top_string
  end

  def root_string
    case triad.position
    when Triad::ROOT_POSITION
      top_string
    when Triad::FIRST_INVERSION
      top_string + 2
    when Triad::SECOND_INVERSION
      top_string + 1
    else
      raise "Unknown triad position #{triad.position}"
    end
  end

  def third_string
    # generate last string
  end

  def fifth_string

  end
end