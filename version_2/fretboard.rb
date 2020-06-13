require_relative 'scale'

class Fretboard
  attr_reader :tuning, :strings, :played_frets, :max_fret

  def initialize
    # highest string to lowest string
    @tuning = %w[E B G D A E]
    @strings = tuning.map { |note| Scale.chromatic(note) }
    @played_frets = Array.new(tuning.length, nil)
    @max_fret = played_frets.max
  end

  def play_note(string_num, note)
    play_fret(string_num, find_fret(string_num, note))
  end

  def find_fret(string_num, note)
    played_string_notes = strings[string_num]
    played_string_notes.index note
  end

  def play_fret(string_num, fret_num)
    played_frets[string_num] = fret_num
  end
end