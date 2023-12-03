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

max_blocks = {
    'red' => 12,
    'green' => 13,
    'blue' => 14,
}

sum = 0

File.foreach 'games.txt' do |line|
    id, rounds = *(line.split ': ')
    id = parse_id id
    id = id.to_i
    possible = true
    parse_rounds rounds do |round|
        if possible == false
            break
        end
        parse_round round do |block|
            number, color = parse_block block
            number = number.to_i
            if number > max_blocks[color]
                possible = false
                break
            end
        end
    end
    if possible
        sum += id
    end
end

puts sum
