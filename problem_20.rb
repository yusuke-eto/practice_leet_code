# @param {String} s
# @return {Boolean}
def is_valid(s)
    return true if s.nil? || s == ''
    array = []
    s.each_char do |c|
        case c
        when "(", "[", "{"
            array << c
        when ")"
            last_char = array.pop rescue ""
            return false if last_char != "("
        when "]"    
            last_char = array.pop rescue ""
            return false if last_char != "["
        when "}"
            last_char = array.pop rescue ""
            return false if last_char != "{"
        else
            return false
        end
    end
    array.empty?
end

s = "()"
puts is_valid(s)

s = "()[]{}"
puts is_valid(s)

s = "(]"
puts is_valid(s)
