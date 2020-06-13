# frozen_string_literal: true

require_relative 'scale'

class Triad
  ROOT_POSITION = 'root position'
  FIRST_INVERSION = 'first inversion'
  SECOND_INVERSION = 'second inversion'
  attr_reader :position, :root

  def initialize(position, root)
    unless ['root', 'first inversion', 'second inversion'].include? position
      raise 'Position must be either "root", "first inversion" or "second inversion"'
    end

    raise 'Root must be a valid note' unless Scale::CHROMATIC.include? root

    @position = position
    @root = root
  end

  def third
    third_index = Scale::CHROMATIC.index root + 2
    third_index -= Scale::CHROMATIC.length if third_index >= Scale::CHROMATIC.length
    Scale::CHROMATIC[third_index]
  end

  def fifth
    Scale::CHROMATIC[Scale::CHROMATIC.index root + 4]
  end
end
