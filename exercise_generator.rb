class ExerciseGenerator
  def initialize
    @notes = ["A", "B", "C", "D", "E", "F", "G"]
    @strings = ["1, 2, 3", "2, 3, 4", "3, 4, 5", "4, 5, 6"]
    @positions = ["root position", "1st inversion", "2nd inversion"]
    @answers = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12]]
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