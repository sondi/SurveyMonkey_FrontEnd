class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :survey
  has_many :choices

  validates :question, presence: true
  validates :question, uniqueness: true
  validate :three_different_choices


 	def three_different_choices
 		choices = self.choices

 		unless choices.length == 3
 			errors.add(:choices, "Debe tener 3 opciones")
		end

		if choices[0].choice == choices[1].choice || choices[0].choice == choices[2].choice || choices[1].choice == choices[2].choice
			errors.add(:choices, "Las opciones deben ser unicas")
    end
	end
end