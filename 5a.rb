lines = File.readlines(ARGV[0])
seeds = lines[0][7..].split(/\s+/).map {|s| s.to_i}
targets = []
translations = {}
for l in 2..lines.length-1 do
	next unless /\S/.match? lines[l]
	if /-to-(\S+) map/.match(lines[l])
		targets.push($1)
		translations[$1] = []
	else
		vals = lines[l].split(/\s+/).map {|n| n.to_i}
		translations[targets.last].push(vals)
	end
end
translations.keys.each { |target|
	translations[target] = translations[target].sort {|a,b| a[1] <=> b[1]}
}
min_s = -1
seeds.each { |s|
	targets.each { |t|
		prev_m = nil
		translations[t].each { |m|
			if s < m[1]
				if prev_m != nil && s < prev_m[1] + prev_m[2]
					s = prev_m[0] + s - prev_m[1]
				end
				break
			end
			prev_m = m
		}
	}
	min_s = s if s < min_s || min_s == -1
}
puts min_s
