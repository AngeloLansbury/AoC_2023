lines = File.readlines(ARGV[0])
directions = lines[0].chomp.gsub(/./, {'L'=>'0', 'R'=>'1'}).split(//).map(&:to_i)
loc = []
branches = {}
for n in 2..lines.length-1 do
        b = lines[n].scan(/\w{3}/)
        branches[b[0]] = [b[1], b[2]]
        loc.push(b[0]) if /A$/.match(b[0])
end
for l in 0..loc.length-1 do
        dirno = 0
        iters = 0
        while true do
                break if /Z$/.match(loc[l])
                loc[l] = branches[loc[l]][directions[dirno]]
                iters += 1
                dirno += 1
                dirno = 0 if dirno == directions.length
        end
        loc[l] = iters
end
puts loc.reduce(&:lcm)
