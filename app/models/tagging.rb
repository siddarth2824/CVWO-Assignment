class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :task

  validates_presence_of :tag
  validates_presence_of :task
end
