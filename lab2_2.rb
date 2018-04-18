# Create safe_invert function

class Hash
    def safe_invert
        self.each_with_object({}){ |(k,v),o| ( o[v]||=[] ) << k }
    end
end
  
fruits_country = { 
    'orange' => 'Marocco',
    'banana' => 'Ecuador',
    'lemon' => 'Marocco',
};
  
puts fruits_country.safe_invert();