# Create function for calculate next dates

#!/usr/bin/ruby
require 'date'

puts "Enter date in format %Y-%m-%d"
date = gets()

puts "Enter years"
years = gets()
puts "Enter months"
months = gets()
puts "Enter days"
days = gets()

puts "Enter count"
count = gets()


parsedDate = Date.parse(date)
$i = 0
$lastStep = Integer(count)

while $i < $lastStep do
    resultYears = Integer(parsedDate.year) + Integer(years)
    resultMonths = Integer(parsedDate.mon) + Integer(months)
    resultDays = Integer(parsedDate.mday) + Integer(days)

    if resultDays >= 30
        resultMonths += resultDays / 30
        resultDays = resultDays % 30

        if resultDays == 0
            resultDays = 1
        end
    end

    if resultMonths > 12
        resultYears += resultMonths / 12
        resultMonths = resultMonths % 12

        if resultMonths == 0
            resultMonths = 1
        end
    end

    parsedDate = Date.new(resultYears, resultMonths, resultDays)

    puts "Result date iteration #{$i} => #{parsedDate.to_date}"

    $i += 1
 end



