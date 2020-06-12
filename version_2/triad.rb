# frozen_string_literal: true
require_relative 'note'

class Triad
  ROOT_POSITION = 'root position'
  FIRST_INVERSION = 'first inversion'
  SECOND_INVERSION = 'second inversion'
  attr_reader :position, :root

  def initialize(position, root)
    @position = position
    @root = root
  end

  def third
    Note::CHROMATIC_SCALE[Note::CHROMATIC_SCALE.index root + 2]
  end

  def fifth
    Note::CHROMATIC_SCALE[Note::CHROMATIC_SCALE.index root + 4]
  end
end
