require_relative 'scale'

class Fretboard
  attr_reader :tuning, :strings, :played_frets, :fret_labels

  def initialize
    # highest string to lowest string
    @tuning = %w[E B G D A E]
    @strings = tuning.map { |note| Scale.chromatic(note) }
    @played_frets = Array.new(tuning.length, nil)
    @fret_labels = {}
  end

  def set_fret_label(fret, label)
    fret_labels[fret] = label
  end

  def fret_label(fret)
    fret_labels[fret]
  end

  def clear_fret_label(fret)
    fret_labels.delete fret
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

  def highest_played_fret
    played_frets.compact.max
  end

  def lowest_played_fret
    played_frets.compact.min
  end
end