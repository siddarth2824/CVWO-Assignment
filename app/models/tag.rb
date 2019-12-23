class Tag < ApplicationRecord
<<<<<<< HEAD
    belongs_to :user 
    validates_presence_of :user 
=======
    belongs_to :user
>>>>>>> 8fe445ae8b398d0562b4ec663dd5069df9a43f3a
    has_many :taggings, dependent: :destroy
    has_many :tasks, through: :taggings
    
end
