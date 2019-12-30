require 'chronic'

class Task < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings
    validates :item, presence: true
    belongs_to :user
    validate :due_date_cannot_be_in_the_past

    def self.tagged_with(name)
        Tag.find_by!(name: name).tasks
    end
    
    def tag_list
        tags.map(&:name).join(" ")
    end
    
    def tag_list=(names)
        self.tags = names.split(" ").map do |name|
            Tag.where(name: name).first_or_create!
        end
    end

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
