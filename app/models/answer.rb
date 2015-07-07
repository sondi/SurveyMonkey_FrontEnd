class Answer < ActiveRecord::Base

	belongs_to :participation
	belongs_to :choice
	# belongs_to :question, :through => :choices

end
