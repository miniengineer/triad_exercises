# frozen_string_literal: true

require_relative 'scale'

class Triad
  ROOT_POSITION = 'root position'
  FIRST_INVERSION = 'first inversion'
  SECOND_INVERSION = 'second inversion'

  MAJOR = 'major'
  MINOR = 'minor'

  attr_reader :position, :root, :type

  def initialize(position, root, type = MAJOR)
    unless ['root position', 'first inversion', 'second inversion'].include? position
      raise 'Position must be either "root position", "first inversion" or "second inversion"'
    end

    raise 'Root must be a valid note' unless Scale::CHROMATIC.include? root

    @position = position
    @root = root
    @type = type
  end

  def third
    case type
    when MAJOR
      idx = 4
    when MINOR
      idx = 3
    else
      raise "Unknown triad: #{type}"
    end

    Scale.chromatic(root)[idx]
  end

  def fifth
    Scale.chromatic(root)[7]
  end
end
