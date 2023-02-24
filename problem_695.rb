# @param {Character[][]} grid
# @return {Integer}
def max_area_of_island(grid)
    hash = {}
    max = 0
    
    grid.each.with_index do |row, y|
        row.each.with_index do |pivot, x|
            next if pivot == 0
            next if hash["#{y}_#{x}"]

            hash["#{y}_#{x}"] = true
            hash, area = mark(y, x, hash, grid, 0)
            max = area if area > max
        end
    end
    max
end

def mark(y, x, hash, grid, area)
    upper_key = (y-1) < 0 ? nil : "#{y-1}_#{x}"
    left_key = (x-1) < 0 ? nil : "#{y}_#{x-1}"
    right_key = (x+1) >= grid[0].length ? nil : "#{y}_#{x+1}"
    under_key = (y+1) >= grid.length ? nil : "#{y+1}_#{x}"


    if upper_key && hash[upper_key].nil? && grid[y-1][x] == 1
        hash["#{y - 1}_#{x}"] = true
        hash, area = mark(y-1, x, hash, grid, area)
    end

    if left_key && hash[left_key].nil? && grid[y][x-1] == 1
        hash["#{y}_#{x-1}"] = true
        hash, area = mark(y, x-1, hash, grid, area)
    end

    if right_key && hash[right_key].nil? && grid[y][x+1] == 1
        hash["#{y}_#{x+1}"] = true
        hash, area = mark(y, x+1, hash, grid, area)
    end

    if under_key && hash[under_key].nil? && grid[y+1][x] == 1
        hash["#{y+1}_#{x}"] = true
        hash, area = mark(y+1, x, hash, grid, area)
    end

    [hash, area+1]
end

grid = [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]
p max_area_of_island(grid)