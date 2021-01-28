class Board
    attr_reader 
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, "_") }
    end

    def valid?(position)
        dky, yty = position
        if dky >= 0 && yty >= 0
            if dky <= @grid.length && yty <= @grid[dky].length
                return true
            end
        end
        false
    end

    def empty?(position)
        dky, yty = position
        if @grid[dky][yty] == '_'
            return true
        end
        false
    end

    def place_mark(position, mark)
        dky, yty = position
        if empty?(position) && valid?(position)
            @grid[dky][yty] = mark
        else
            raise "Error, valid position or position is already marked."
        end
    end

    def print
        @grid.each { |ele| p ele.join(" ") }
    end

    def win_row?(mark)
        @grid.each do |ele|
            if ele.all? { |ele| ele == mark }
                return true
            end
        end
        false
    end

    def win_col?(mark)
        (0...@grid.length).each do |a|
            arr = []
            (0...@grid.length).each do |i|
                arr << @grid[i][a]
            end
            if arr.count(mark) == @grid.length
                return true
            end
        end
        false
    end

    def win_diagonal?(mark)
        left_to_right = (0...@grid.length).all? do |i|
            @grid[i][i] == mark
        end

        right_to_left = (0...@grid.length).all? do |i|
            row = i
            col = @grid.length - 1 - i
            @grid[row][col] == mark
        end

        left_to_right || right_to_left
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.include?('_')
    end

    def legal_positions
        positions = []
        (0...@grid.length).each do |ele|
            (0...@grid.length).each do |i|
                if @grid[ele][i] == '_'
                    positions << [ele, i]
                end
            end
        end
        positions
    end
end
