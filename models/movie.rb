class Movie < ActiveRecord::Base
  has_many :ratings
  has_many :reviewers, through: :ratings

  validates :year,
    numericality: { less_than_or_equal_to: Date.today.year }

  validates :title,
    length: { maximum: 25, minimum: 3 } # you can customize error messages

  # validate :check_some_stuff # custom validations
  after_create :movie_just_created

  def movie_just_created
    puts "a movie, with title #{title}, has just been created."
  end

end
