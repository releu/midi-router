require "unimidi"
require "micromidi"

# sysex_msg = [0xFA]

# output.open { |output| output.puts(sysex_msg) }

input = UniMIDI::Input.gets

output = UniMIDI::Output.gets

# notes = [36, 40, 43] # C E G
# octaves = 5
# duration = 0.1

# (0..((octaves - 1) * 12)).step(12) do |oct|
#   notes.each do |note|
#     output.puts(0x90, note + oct, 100) # NOTE: on
#     sleep(duration) # wait
#     output.puts(0x80, note + oct, 100) # NOTE: off
#   end
# end

# output.puts(sysex_msg)

while pack = input.gets
  pack.each do |m|
    p m if m[:data] != [248]
    output.puts(m[:data])
  end
end