class ExerciseGenerator
  def initialize
    @notes = ["A", "B", "C", "D", "E", "F", "G"]
    @strings = ["1, 2, 3", "2, 3, 4", "3, 4, 5", "4, 5, 6"]
    @positions = ["root position", "1st inversion", "2nd inversion"]
    @answers = [
      [{ r: [3,10], t: [3,10], f: [5,2] }, { r: [5,2], t: [3,6], f: [4,2] }, { r: [4,6], t: [5,2], f: [3,2] }],
      [{ r: [2,10], t: [3,6], f: [4,2] }, { r: [4,6], t: [2,10], f: [3,2] }, { r: [3,6], t: [5, 6], f: [2,6] }],
      [{ r: [1,14], t: [2,10], f: [3,2] }, { r: [3,2], t: [1,10], f: [2,2] }, { r: [2,6], t: [3,2], f: [1,6] }],
      [{ r: [0,14], t: [1,10], f: [2,2] }, { r: [2,2], t: [0,10], f: [1,2] }, { r: [1,6], t: [2,2], f: [0,6] }],
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