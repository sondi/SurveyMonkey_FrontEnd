class Survey < ActiveRecord::Base
  # Remember to create a migration!
  validates :title, :choices, :question, presence: true
  validates :title, :question, uniqueness: true

end
