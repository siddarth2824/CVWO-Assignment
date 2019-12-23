require 'chronic'

class Task < ApplicationRecord
    attr_accessor :item, :description, :tag_list
    acts_as_taggable_on :tasks
    validates :item, presence: true,
                     length: { minimum: 5 } 
    belongs_to :user
    validate :due_date_cannot_be_in_the_past

<<<<<<< HEAD
    accepts_nested_attributes_for :tags

    def self.tagged_with(name)
        Tag.find_by!(name: name).tasks
    end
    
    def tag_list
        self.tags.collect do |tag|
          tag.name
        end.join(" ")
      end
    
    def tag_list=(tags_string)
        tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
        new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
        self.tags = new_or_found_tags
    end

=======
>>>>>>> 8fe445ae8b398d0562b4ec663dd5069df9a43f3a
    def due_date
        due.to_s
    end

    def due_date=(str)
        self.due = Chronic.parse(str).to_date.to_s

    rescue
        @invalid_date = true
    end

    def validate
        errors.add :due, 'is not a valid date' if @invalid_date
    end

    def due_date_cannot_be_in_the_past
        if due.past?
            errors.add(:due_date, "is not a valid date")
        end
    end
end
