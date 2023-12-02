sum = 0

class String
    def first
        self[0]
    end
    def last
        self[-1]
    end
end

File.foreach("calibration.txt") do |line|
    numbers = line.delete "^[0-9]" 
    sum += "#{numbers.first}#{numbers.last}".to_i
end

puts sum
