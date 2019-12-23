class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  require 'chronic'
<<<<<<< HEAD
  
  has_many :tasks
  has_many :tags
  
=======

  acts_as_tagger
  has_many :tasks 

>>>>>>> 8fe445ae8b398d0562b4ec663dd5069df9a43f3a
end
