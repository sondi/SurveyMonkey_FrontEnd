User.create(name: "sandra", email: "sandra@mail.com", password: "Sondi12345")
User.create(name: "mau", email: "mau@mail.com", password: "Mau12345")
User.create(name: "santi", email: "santi@mail.com", password: "Santi12345")

count = 0
User.all.each do |user|
	3.times do
		user.authored_surveys << Survey.create(name: "Test#{count+=1}")
	end
end

Participation.create(user_id: 1, survey_id: 4)
Participation.create(user_id: 1, survey_id: 5)
Participation.create(user_id: 1, survey_id: 6)
Participation.create(user_id: 2, survey_id: 7)
Participation.create(user_id: 2, survey_id: 8)
Participation.create(user_id: 2, survey_id: 9)