class Author < ActiveRecord::Base
  has_many :assignments
  has_many :book, through: :assignments
end
