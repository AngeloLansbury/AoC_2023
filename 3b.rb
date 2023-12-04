n = {0 => {}}
s = {0 => {}}
l = 1
File.foreach(ARGV[0]) { |line|
	line = line.chomp
	n[l] = {}
	line.enum_for(:scan, /\d+/).map do
		n[l][Regexp.last_match.offset(0).first + 1] = Regexp.last_match[0]
	end
	s[l] = {}
	line.enum_for(:scan, /\*/).map do
		s[l][Regexp.last_match.offset(0).first + 1] = []
	end
	l += 1
}
n[l] = {}
s[l] = {}

sum = 0
for i in 1..l-1 do
	n[i].keys.each { |k|
		len = n[i][k].length
		val = n[i][k].to_i
		s[i][k - 1].push(val) unless s[i][k - 1].nil?
		s[i][k + len].push(val) unless s[i][k + len].nil?
		for x in k-1..k+len do
			s[i - 1][x].push(val) unless s[i - 1][x].nil?
			s[i + 1][x].push(val) unless s[i + 1][x].nil?
		end
	}
end
for i in 1..l-1 do
	s[i].values.each { |g|
		sum += g[0] * g[1] if g.length == 2
	}
end
puts sum
