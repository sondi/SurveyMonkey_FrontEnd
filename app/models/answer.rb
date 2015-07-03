class Answer < ActiveRecord::Base

	belongs_to :participation
	belongs_to :chioce
	belongs_to :question, :through => :choices

end
