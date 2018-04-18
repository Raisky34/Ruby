# Parse XML File and create World by file 'cia-1996.xml'

require "rexml/document"
include REXML

class World
    def initialize(pathToFile)
        @continents = []

        doc = Document.new File.new(pathToFile)
        doc.elements.each("cia/continent") { |element| @continents.push(Continent.new(element)) }
        doc.elements.each("cia/country") { |element| self.addCountryToContinent(element) }
    end

    def addCountryToContinent(country)
        continentId = country.attributes["continent"]
        currentContinent = @continents.detect { |continent| continent.getName() == continentId }
        
        currentContinent.initCountry(country)
    end

    def printAllWithSort
        newContinents = @continents

        newContinents
            .sort_by(&:name)
            .each { |x| puts x.printParams() }
    end

    def getCountryWithHieghtsPopulation
        newContinents = @continents
        countries = []

        puts 'Country with Hieghts population'
        newContinents.each { |x| countries.push(*x.countries) }
        countries.sort_by(&:population)
        countries[0].printParams()
    end

    def getTopFiveIflationCounties
        newContinents = @continents
        countries = []

        puts 'Top 5 countries with hiegest inflation'
        newContinents.each { |continent| countries.push(*continent.countries) }
        countries.sort_by(&:inflation)
        countries[0..4].each { |country| country.printParams()}
    end
end

class Continent
    attr_accessor :id, :name
    def initialize(element)
        @id = element.attributes["id"]
        @name = element.attributes["name"]

        @countries = []
    end

    def getName
        return @name
    end

    def printParams
        puts '====== Continent ======='
        puts "ID: #{@id}"
        puts "Name: #{@name}"
        puts ""
        puts 'Countries: '

        @countries.map{ |x| x.printParams()}
        puts '======================'
    end

    def initCountry(country)
        @countries.push(Country.new(country))
    end

    def printAllWithSort
        puts '====== Country ======='
        puts "ID: #{@id}"
        puts "Name: #{@name}"
        puts ""
        puts 'Countries: '

        @countries
            .sort_by(&:name)
            .map{ |x| x.printParams()}
        puts '======================'
    end

    def countries
        return @countries
    end
end

class Country
    attr_accessor :id, :name, :population
    def initialize(element)
        @id = element.attributes["id"]
        @continent = element.attributes["continent"]
        @name = element.attributes["name"]
        @datacode = element.attributes["datacode"]
        @population = element.attributes["population"] || 0
        @population_growth = element.attributes["population_growth"]
        @infant_mortality = element.attributes["infant_mortality"]
        @gdp_agri = element.attributes["gdp_agri"]
        @inflation = element.attributes["inflation"]
        @gdp_total = element.attributes["gdp_total"]
        @indep_date = element.attributes["indep_date"]
        @government = element.attributes["government"]
        @capital = element.attributes["capital"]
    end

    def id
        return @id
    end

    def name
        return @name
    end

    def printParams
        puts '======= Country ======='
        puts "ID: #{@id}"
        puts "Continent: #{@continent}"
        puts "Name: #{@name}"
        puts "Datacode: #{@datacode}"
        puts "Population: #{@population}"
        puts "Population growth: #{@population_growth}"
        puts "Infant mortality: #{@infant_mortality}"
        puts "Gdp agri: #{@gdp_agri}"
        puts "Inflation: #{@inflation}"
        puts "Gdp total: #{@gdp_total}"
        puts "Indep date: #{@indep_date}"
        puts "Government: #{@government}"
        puts "Capital: #{@capital}"
        puts '======================'
    end

    def population
        return @population.to_i
    end

    def inflation
        return @inflation.to_f
    end
end

world = World.new("cia-1996.xml")

world.printAllWithSort()
world.getCountryWithHieghtsPopulation()
world.getTopFiveIflationCounties()