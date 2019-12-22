class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  require 'chronic'
  
  has_many :tasks do
    def today 
      find(:all, :conditions => ["due = ? and complete is null", Date.today.to_s])
    end
    def upcoming
      find(:all, :conditions => ["due > ? and complete is null", Date.today.to_s])
    end
  end
  
  has_many :tags
end
