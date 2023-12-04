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
	line.enum_for(:scan, /[^0-9.]/).map do
		s[l][Regexp.last_match.offset(0).first + 1] = Regexp.last_match[0]
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
		addend = s[i][k - 1].nil? && s[i][k + len].nil? ? 0 : val
		for x in k-1..k+len do
			break if addend > 0
			addend = val unless s[i - 1][x].nil? && s[i + 1][x].nil?
		end
		sum += addend
	}
end
puts sum
