sum = 0

class String
    def first
        self[0]
    end
    def last
        self[-1]
    end
end

digits = '0123456789'

spelled = {
    'o' => ['one'],
    't' => ['two', 'three'],
    'f' => ['four', 'five'],
    's' => ['six', 'seven'],
    'e' => ['eight'],
    'n' => ['nine'],
}

translated = {
    'one' => '1',
    'two' => '2',
    'three' => '3',
    'four' => '4',
    'five' => '5',
    'six' => '6',
    'seven' => '7',
    'eight' => '8',
    'nine' => '9',
}

File.foreach "calibration.txt" do |line|
    numbers = ''
    for i in 0...line.length
        char = line[i].chr
        if digits.include? char
            numbers += char
        elsif spelled.has_key? char
            options = spelled[char]
            options.each do |option|
                if line[i, option.length] == option
                    numbers += translated[option]
                end
            end
        end
    end
    sum += "#{numbers.first}#{numbers.last}".to_i
end

puts sum
