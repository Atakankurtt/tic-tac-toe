class HumanPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        p 'Enter 2 number (space between them).'
        input = gets.chomp
        position = []
        input.each_char do |ele|
            if "asdfghjklşiqwertyuıopğüzxcvbnmöç".include?(ele) || input.length > 3
                raise "Valid input"
            end
        end
        input.split(" ").each { |ele| position << ele.strip.to_i }
        if position.length > 2 && !legal_positions.include?(position)
            raise
        end
        position
    end
end