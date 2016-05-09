class Book < ActiveRecord::Base
	has_many :comments,  dependent: :destroy
  has_many :assignments
  has_many :authors, through: :assignments
end
