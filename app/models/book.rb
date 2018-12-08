class Book < ApplicationRecord

	belongs_to :user

 	validates :title, presence: true
  	validates :opinion, presence: true
  	validates :opinion, length: { in: 0..200 }

end
