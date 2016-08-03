require 'pry' # incase you want to use binding.pry
require 'active_record'
require_relative 'models/movie'
require_relative 'models/rating'
require_relative 'models/reviewer'

# Output messages from AR to STDOUT
ActiveRecord::Base.logger = Logger.new(STDOUT)

puts "Establishing connection to database ..."
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  encoding: 'unicode',
  pool: 5,
  database: 'active_record_ratings',
  username: 'faisal',
  password: '',
  host: 'localhost',
  port: 5432,
  min_messages: 'error'
)
puts "CONNECTED"

puts "Setting up Database (recreating tables) ..."

# ActiveRecord::Schema.define do
#   # check if these tables exist, completely remove them if they do
#   drop_table :movies, force: :cascade if ActiveRecord::Base.connection.table_exists?(:movies)
#   drop_table :reviewers, force: :cascade if ActiveRecord::Base.connection.table_exists?(:reviewers)
#   drop_table :ratings, force: :cascade if ActiveRecord::Base.connection.table_exists?(:ratings)
#
#   # migrations
#   create_table :movies do |m|
#     m.column :title, :string
#     m.column :year, :integer
#     m.column :director, :string
#     m.timestamps
#   end
#
#   create_table :reviewers do |r|
#     r.column :name, :string
#     r.timestamps
#   end
#
#   create_table :ratings do |r|
#     # r.references :movie
#     # r.references :reviewer
#     r.column :movie_id, :integer
#     r.column :reviewer_id, :integer
#     r.column :stars, :integer
#     r.column :rating_date, :date
#     r.timestamps
#   end
#
# end

puts "Setup DONE"
