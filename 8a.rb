lines = File.readlines(ARGV[0])
directions = lines[0].chomp.gsub(/./, {'L'=>'0', 'R'=>'1'}).split(//).map(&:to_i)
loc = 'AAA'
branches = {}
for n in 2..lines.length-1 do
        b = lines[n].scan(/\w{3}/)
        branches[b[0]] = [b[1], b[2]]
end
dirno = 0
iters = 0
while true do
        break if loc == 'ZZZ'
        iters += 1
        loc = branches[loc][directions[dirno]]
        dirno += 1
        dirno = 0 if dirno == directions.length
end
puts iters
