# frozen_string_literal: true
class ExerciseGenerator
  def initialize
    @notes = %w[A B C D E F G]
    @strings = ['1, 2, 3', '2, 3, 4', '3, 4, 5', '4, 5, 6']
    @positions = ['root position', '1st inversion', '2nd inversion']
    @answers = [
      [{ r: [3, 2], t: [4, 2], f: [5, 0] }, { r: [5, 0], t: [3, 1], f: [4, 0] }, { r: [4, 1], t: [5, 0], f: [3, 0] }],
      [{ r: [2, 2], t: [3, 1], f: [4, 0] }, { r: [4, 1], t: [2, 2], f: [3, 0] }, { r: [3, 1], t: [4, 1], f: [2, 1] }],
      [{ r: [1, 3], t: [2, 2], f: [3, 0] }, { r: [3, 0], t: [1, 2], f: [2, 0] }, { r: [2, 1], t: [3, 0], f: [1, 1] }],
      [{ r: [0, 3], t: [1, 2], f: [2, 0] }, { r: [2, 0], t: [0, 2], f: [1, 0] }, { r: [1, 1], t: [2, 0], f: [0, 1] }]
    ]
  end

  def note
    @notes.sample
  end

  def string
    @strings.sample
  end

  def position
    @positions.sample
  end

  def answer(string, position)
    index1 = @strings.index(string)
    index2 = @positions.index(position)
    @answers[index1][index2]
  end

end