class Survey < ActiveRecord::Base
	# REVISAR
  # validates :title, :choices, :question, presence: true
  # validates :title, :question, uniqueness: true
  
	belongs_to :user
	has_many :questions
	has_many :participations
end
