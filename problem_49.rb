# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
    hash = {}
    strs.each do |str|
        key = build_key(str)
        hash[key] ||= []
        hash[key] << str
    end
    hash.values
end

def build_key(str)
    hash = {}
    str.each_char do |s|
        hash[s] ||= 0
        hash[s] += 1
    end
    hash
end

strs = ["eat","tea","tan","ate","nat","bat"]
p group_anagrams(strs)

strs = [""]
p group_anagrams(strs)

strs = ["a"]
p group_anagrams(strs)