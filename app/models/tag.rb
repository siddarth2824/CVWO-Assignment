class Tag < ApplicationRecord
    validates_uniqueness_of :name, scope: [:user_id]
    has_many :taggings, dependent: :destroy
    has_many :tasks, through: :taggings
    belongs_to :user, optional: true

end
