# @param {String} s
# @return {Integer}
def first_uniq_char(s)
    hash = {}
    hash2 = {}
    s.chars.each.with_index do |l, i|
        if hash[l].nil?
            hash[l] = i
        else
            hash2[l] = i
        end
    end

    tmp = (hash.keys - hash2.keys).min do |t|
        hash[t]
    end
    
    hash[tmp].nil? ? -1 : hash[tmp]
end

s = "leetcode"
p first_uniq_char(s)