lines = File.readlines(ARGV[0])
gals = []
cols = Array.new(lines[0].length, 0)
er = []
for l in 0..lines.length-1 do
        loc = -1
        while (loc = lines[l].index("#", loc + 1)) != nil do
                cols[loc] = 1
                gals.push([l, loc])
        end
        er.push(l) unless gals.last[0] == l
end
ec = (0..cols.length-1).find_all {|a| cols[a] == 0}
t = 0
for i in 0..gals.length-2 do
        for j in i+1..gals.length-1 do
                y = [gals[i][0], gals[j][0]].sort
                x = [gals[i][1], gals[j][1]].sort
                t += y[1] - y[0] + x[1] - x[0]
                t += 999999 * (er.find_all {|a| y[0] < a && a < y[1]}).length
                t += 999999 * (ec.find_all {|a| x[0] < a && a < x[1]}).length
        end
end
puts t
