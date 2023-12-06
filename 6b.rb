lines = File.readlines(ARGV[0])
t = lines[0].delete(" ").match(/\d+/)[0].to_i
d = lines[1].delete(" ").match(/\d+/)[0].to_i
ctr = t / 2.0
ofs = (t % 2) / 2.0
c = ofs - 0.5
for x in 0..ctr.floor do
	break unless (ctr**2 - (ofs + x)**2).to_i > d
	c += 1
end
puts (c * 2).to_i
