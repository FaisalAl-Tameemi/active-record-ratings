class Movie < ActiveRecord::Base
  has_many :ratings
  has_many :reviewers, through: :ratings

  validates :year,
    numericality: { less_than_or_equal_to: Date.today.year }

end
