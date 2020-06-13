# frozen_string_literal: true

class Scale
  CHROMATIC = %w[A A# B C C# D D# E F F# G G#]

  def self.chromatic(key)
    CHROMATIC.rotate(CHROMATIC.index(key))
  end
end
