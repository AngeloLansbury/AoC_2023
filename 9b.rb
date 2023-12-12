t = 0
File.foreach(ARGV[0]) { |l|
        v = [l.scan(/-?\d+/).map(&:to_i)]
        while true do
                nv = []
                empty = 1
                for i in 0..v.last.length-2 do
                        diff = v.last[i+1] - v.last[i]
                        empty = 0 if diff != 0
                        nv.push(diff)
                end
                v.push(nv)
                break if empty == 1
        end
        mod = 0
        while nv = v.pop do
                mod = nv.first - mod
        end
        t += mod
}
puts t
