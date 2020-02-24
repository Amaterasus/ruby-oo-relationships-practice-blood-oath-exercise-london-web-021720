class Follower

    attr_reader :name, :age
    attr_accessor :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end


    def cults
        # returns an Array of this follower's cults
        # currently wont work how I want as it will only return the blood oaths and not an array of the cults.
        list_of_cults = BloodOath.all.select { |oaths| oaths.follower == self }
        list_of_cults.map { |cult| cult.cult }
    end

    def join_cult(cult)
        # takes in an argument of a Cult instance and adds this follower to the cult's list of followers
        if self.age < cult.minimum_age
            puts "Flee this place Youngling!!!"
        else
            BloodOath.new(cult, self)
        end
    end

    def my_cults_slogans
        # prints out all of the slogans for this follower's cults
        cults.each { |cult| puts cult.slogan}
    end

    def fellow_cult_members
        # returns a unique Array of followers who are in the same cults as you
        fellows = self.cults.map { |cult| cult.my_followers }
        fellows.flatten.uniq
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        # takes an Integer argument that is an age and returns an Array of followers who are the given age or older
        Follower.all.select { |follower| follower.age == age}
    end

    def self.sort_by_cults_joined
        all.sort_by { |follower| follower.cults.count }.reverse
    end

    def self.most_active
        # returns the Follower instance who has joined the most cults
        sort_by_cults_joined[0]
    end

    def self.top_ten
        #returns an Array of followers; they are the ten most active followers
        sorted_followers = sort_by_cults_joined
        sorted_followers[0..9]
    end
end