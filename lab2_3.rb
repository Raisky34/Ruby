# Make histogram

class Array
    def to_histogram
        return self.inject(Hash.new{ 0 }){ |result, i|
            result[i] += 1;
            result;
        }
    end
end


mainArray = ['orange', 'banana', 'banana', 'banana', 'lemon', 'lemon'];
# => {'orange'=>1, 'banana'=>3, 'lemon'=>2} 

puts mainArray.to_histogram();