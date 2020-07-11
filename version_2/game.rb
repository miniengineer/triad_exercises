# 1. create instance of Triad
#
# 2. Create instance of Guitar Triad
#
# 3. Create instance of Fretboard
#
# 4. Call play method of Guitar Triad and pass the instance of Guitar Triad to it
#

require_relative 'triad'
require_relative 'guitar_triad'
require_relative 'fretboard'
require_relative 'printer'

puts "Game start"

sleep 2

while true
  triad_position = [Triad::SECOND_INVERSION, Triad::FIRST_INVERSION, Triad::ROOT_POSITION].sample
  note = ('A'..'G').to_a.sample
  minor_or_major = [Triad::MINOR, Triad::MAJOR].sample
  string = (2..5).to_a.sample
  puts "Play me #{note} #{minor_or_major} triad on string #{string + 1} in #{triad_position} position"

  sleep 2
  t = Triad.new(triad_position, note, minor_or_major)
  gt = GuitarTriad.new(t, string)
  f = Fretboard.new

  gt.play(f)

  p = Printer.new(f)

  puts 'To see the answer press any key'
  STDIN.gets

  puts p.print_notes
end
