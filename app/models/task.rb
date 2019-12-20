class Task < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings
    validates :item, presence: true,
                     length: { minimum: 5 }
    belongs_to :user

    def self.tagged_with(name)
        Tag.find_by!(name: name).tasks
    end
    
    def tag_list
        tags.map(&:name).join(", ")
    end
    
    def tag_list=(names)
        self.tags = names.split(" ").map do |name|
            Tag.where(name: name).first_or_create!
        end
    end
end
