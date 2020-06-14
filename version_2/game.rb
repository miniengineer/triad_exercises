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

t = Triad.new('root position', 'F')
gt = GuitarTriad.new(t, 5)
f = Fretboard.new

gt.play(f)

p = Printer.new(f)

puts p.print_notes