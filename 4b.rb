lines = File.readlines(ARGV[0])
c = Array.new(lines.length, 1)
for l in 0..lines.length-1 do
	v = (lines[l][10..38] + lines[l][41..115]).split(/\s+/).sort
	h = 0
	v.reduce { |c, i| h += 1 if c.eql? i; c = i }
	for n in l+1..l+h do
		c[n] += c[l]
	end
end
puts c.sum
