class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map{|aud| aud.actor}
    end

    def locations
        self.auditions.map(&:location)
    end

    def lead
        lead = self.auditions.find{|aud| aud.hired}
        lead ? lead : "No actor has been hired for #{self.character_name}"
    end

    def understudy
        hireds = self.auditions.filter{|aud| aud.hired}
        understudy = hireds[1]
        understudy ? understudy : "No understudy has been hired for #{self.character_name}"
    end

end