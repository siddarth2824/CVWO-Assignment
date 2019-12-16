class Task < ApplicationRecord
    validates :item, presence: true,
                     length: { minimum: 5 }
end
