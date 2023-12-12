t = [{"-"=>0,"J"=>1,"7"=>3},{"F"=>0,"|"=>1,"7"=>2},{"L"=>1,"-"=>2,"F"=>3},{"L"=>0,"J"=>2,"|"=>3}]
m = []
sx = 0
sy = 0
File.foreach(ARGV[0]) { |l|
        i = l.index("S")
        if i != nil
                sx = i + 1
                sy = m.length + 1
        end
        m.push(("." + l).split(//))
}
m.unshift(Array.new(m[0].length, "."))
m.push(Array.new(m[0].length, "."))
x = sx
y = sy
g = 0
g = 1 if /[7|F]/.match(m[y-1][x])
g = 2 if /[L\-F]/.match(m[y][x-1])
c = 0
while g != nil do
        x += (g == 0 ? 1 : (g == 2 ? -1 : 0))
        y += (g == 3 ? 1 : (g == 1 ? -1 : 0))
        g = t[g][m[y][x]]
        c += 1
end
puts c/2
