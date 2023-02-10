# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
   profit = 0
   lowest = 1000000
   prices.each do |p|
     lowest = p if p < lowest
     if p - lowest > profit
        profit = p - lowest
     end
   end
   profit
end

prices = [7,6,4,3,1]
p max_profit(prices)

prices = [7,1,5,3,6,4]
p max_profit(prices)