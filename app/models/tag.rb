class Tag < ApplicationRecord
    belongs_to :user 
    validates_presence_of :user 
    has_many :taggings, dependent: :destroy
    has_many :tasks, through: :taggings
    
end
