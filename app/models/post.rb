class Post < ApplicationRecord
	#associations
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_one_attached :avatar
	#validation
	validates_presence_of :title
end
