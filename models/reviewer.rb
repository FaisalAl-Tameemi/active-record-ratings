class Reviewer < ActiveRecord::Base
  has_many :ratings
  has_many :movies, through: :ratings
end
