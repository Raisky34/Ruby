# Create class for chipper

class Chiper
   def readFile(pathToFile)
   	f = File.new(pathToFile);
	content = f.read;
	f.close;
	return content;
   end

   def getStep(step)
   	maxStep = 26;

   	if step < maxStep || -maxStep > step
   		return step;
   	end

   	if step > 0
   		step = step - ((step / maxStep) * maxStep)
   	else
   		step = step + ((step / maxStep) * maxStep)
   	end

   	return step;
   end

   def normilazeStep(charNumber, itemOrd)
   	if itemOrd >= 65 and itemOrd <= 90
   	 	if charNumber > 90
   	 		charNumber -= 26
   	 	elsif charNumber < 65
			charNumber += 26
   	 	end
   	elsif itemOrd >= 97 and itemOrd <= 122
		if charNumber > 122
   	 		charNumber -= 26
   	 	elsif charNumber < 97
			charNumber += 26
   	 	end
   	end

   	return charNumber
   end

   def chipString(string, chipperStep)
	arrayOfString = string.split('');
   	step = self.getStep(chipperStep);

   	arrayOfString = arrayOfString.map { |item| (self.normilazeStep(item.ord + step, item.ord)).chr }

   	return arrayOfString.join('');
   end

   def decode()
   	content = self.readFile("./example.txt");
   	result = self.chipString(content, 2);
   	puts "Decode #{result}";
   end

   def encode();
   	content = self.readFile("./example.txt");
   	result = self.chipString(content, -2);
   	puts "Encode #{result}";
   end

   def sayHi
      puts "Hello #{@name}!";
   end
end

chiper = Chiper.new()
chiper.decode()
chiper.encode()