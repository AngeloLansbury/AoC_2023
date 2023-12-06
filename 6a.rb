lines = File.readlines(ARGV[0])
t = lines[0].scan(/\d+/).map(&:to_i)
d = lines[1].scan(/\d+/).map(&:to_i)
r = 1
for i in 0..t.length-1 do
	ctr = t[i] / 2.0
	ofs = (t[i] % 2) / 2.0
	c = ofs - 0.5
	for x in 0..ctr.floor do
		break unless (ctr**2 - (ofs + x)**2).to_i > d[i]
		c += 1
	end
	r *= (c * 2).to_i
end
puts r
