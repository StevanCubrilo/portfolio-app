class Skill < ApplicationRecord
    include Placeholder
    validates_presence_of :title, :percent_utilized 

    after_initialize :set_defaults

    def set_defaults
        self.badge ||= "https://placehold.co/200x200"
    end

end
