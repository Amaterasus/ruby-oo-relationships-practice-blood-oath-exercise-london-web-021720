class Cult

    attr_reader :name, :year_founded
    attr_accessor :location, :slogan, :minimum_age

    @@all = []
    

    def initialize(name, location, year_founded, slogan, minimum_age)
        @name = name
        @location = location
        @year_founded = year_founded
        @slogan = slogan
        @minimum_age = minimum_age
        @@all << self
    end

    def recruit_follower(follower)
        # takes in an argument of a Follower instance and adds them to this cult's list of followers
        if follower.age < minimum_age
            puts "Flee this place Youngling"
        else
            BloodOath.new(self, follower)
        end
    end

    def cult_population
        # returns an Integer that is the number of followers in this cult
        BloodOath.all.select { |oaths| oaths.cult == self}.size
    end

    def my_followers
        list_of_followers = BloodOath.all.select { |oaths| oaths.cult == self }
        list_of_followers.map { |follower| follower.follower }
    end

    def average_age
        # returns a Float that is the average age of this cult's followers
        cumlative_age = my_followers.map { |follower| follower.age }.sum
        (cumlative_age.to_f / cult_population).round(2)
    end

    def my_followers_mottos
        # prints out all of the mottos for this cult's followers
        my_followers.each { |follower| puts follower.life_motto }
    end
    
    def self.all
        @@all
    end

    def self.find_by_name(cult_name)
        # takes a String argument that is a name and returns a Cult instance whose name matches that argument
        Cult.all.find { |cult| cult.name == cult_name}
    end

    def self.find_by_location(cult_location)
        # takes a String argument that is a location and returns an Array of cults that are in that location
        Cult.all.select { |cult| cult.location == cult_location}
    end

    def self.find_by_founding_year(founding_year)
        # takes an Integer argument that is a year and returns all of the cults founded in that year
        Cult.all.select { |cult| cult.year_founded == founding_year }
    end

    def self.least_popular
        # returns the Cult instance who has the least number of followers :(
        cults = all.sort_by { |cult| cult.cult_population }
        # I would prefer to make this code return an array so I've done it with the code commented out.
        # unpopular_cult = cults[0]
        # cults.select { |cult| cult.cult_population == unpopular_cult.cult_population}
        cults[0]
        
    end

    def self.most_common_location
        # # returns a String that is the location with the most cults
        # a.inject(Hash.new(0)) {|h,i| h[i] += 1; h }
        # all.inject(Hash.new(0)) { |key, value| key[value] += 1; key }
        cult_locations = Cult.all.each_with_object (Hash.new(0)) { |object, hash| hash[object.location] += 1 }
        cult_locations.sort_by { |key, value| value}.last.first

    end

end