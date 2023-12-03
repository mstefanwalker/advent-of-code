def parse_id id_part
    label, id = *(id_part.split ' ')
    return id
end

def parse_rounds rounds_part
    rounds = rounds_part.split '; '
    rounds.each { |round| yield round }
end

def parse_round round_part
    blocks = round_part.split ', '
    blocks.each { |block| yield block }
end

def parse_block block_part
    return block_part.split ' '
end

sum = 0

File.foreach 'games.txt' do |line|
    id, rounds = *(line.split ': ')
    id = parse_id id
    id = id.to_i
    min_blocks = {
        'red' => 0,
        'green' => 0,
        'blue' => 0,
    }
    parse_rounds rounds do |round|
        parse_round round do |block|
            number, color = parse_block block
            number = number.to_i
            if number > min_blocks[color]
                min_blocks[color] = number
            end
        end
    end
    power = 1
    min_blocks.each do |_,num|
        power *= num
    end
    sum += power
end

puts sum
