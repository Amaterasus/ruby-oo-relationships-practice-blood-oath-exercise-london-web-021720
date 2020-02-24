class BloodOath

    attr_reader :cult, :follower, :initiation_date

    @@all = []

    def initialize(cult, follower)
        @cult = cult
        @follower = follower
        @initiation_date = Time.now.strftime("%F")
        @@all << self
    end

    def self.all
       @@all 
    end

    def self.first_oath
        # returns the Follower instance for the follower that made the very first blood oath
        @@all[0].follower
    end

end