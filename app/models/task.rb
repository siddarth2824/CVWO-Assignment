require 'chronic'

class Task < ApplicationRecord
    attr_accessor :item, :description, :tag_list
    acts_as_taggable_on :tasks
    validates :item, presence: true,
                     length: { minimum: 5 } 
    belongs_to :user
    validate :due_date_cannot_be_in_the_past

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
