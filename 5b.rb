lines = File.readlines(ARGV[0])
seeddata = lines[0][7..].split(/\s+/).map {|s| s.to_i}
seeds = []
(0..seeddata.length-2).step(2) do |sn|
	seeds.push([[seeddata[sn], seeddata[sn+1]]])
end
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
seeds.each { |srs|
	targets.each { |t|
		new_srs = []
		srs.each { |sr|
			translations[t].each { |m|
				if sr[0] < m[1]
					if sr[0] + sr[1] < m[1]
						new_srs.push(sr)
						break;
					else
						new_srs.push([sr[0], m[1] - sr[0]])
						sr[1] -= m[1] - sr[0]
						sr[0] = m[1]
					end
				end
				if sr[0] < m[1] + m[2]
					if sr[0] + sr[1] < m[1] + m[2]
						new_srs.push([m[0] + sr[0] - m[1], sr[1]])
						break;
					else
						new_srs.push([m[0] + sr[0] - m[1], m[1] + m[2] - sr[0]])
						sr[1] -= m[1] + m[2] - sr[0]
						sr[0] = m[1] + m[2]
					end
				end
			}
		}
		srs = new_srs.sort {|a,b| a[0] <=> b[0]}
	}
	min_s = srs[0][0] if min_s > srs[0][0] || min_s == -1
}
puts min_s
