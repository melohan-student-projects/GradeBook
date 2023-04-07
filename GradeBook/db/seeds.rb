require 'faker'

puts "----------------------------------------------------------------------------------------------------------------"

puts "Creating user types..."

UserType.create!(
  name: "Teacher",
  slug: "TEA",
  description: "Teacher users can view and manage their student records."
)

UserType.create!(
  name: "Student",
  slug: "STU",
  description: "Student users can view their own records and grades."
)

puts "User types created successfully!"

puts "----------------------------------------------------------------------------------------------------------------"

puts "Creating users ..."

teacher_user_type = UserType.find_by(slug: "TEA")
student_user_type = UserType.find_by(slug: "STU")

User.create!(
  firstname: "Rachel",
  lastname: "Green",
  email: "rachel.green@cpnv.ch",
  password: "rgreen12345",
  user_type: student_user_type
)

User.create!(
  firstname: "Ada",
  lastname: "Lovelace",
  email: "ada.lovelace@cpnv.ch",
  password: "alovelace12345",
  user_type: teacher_user_type
)

10.times do
  first_name = Faker::Name.first_name;
  last_name = Faker::Name.last_name;
  User.create!(
    firstname: first_name,
    lastname: last_name,
    email: "#{first_name}.#{last_name}@cpnv.ch",
    password: "password",
    user_type: student_user_type
  )
end
puts "User created successfully!"

puts "----------------------------------------------------------------------------------------------------------------"

puts "Creating categories ..."
Category.create!(name: 'General branches')
Category.create!(name: 'Application modules and work experience')
Category.create!(name: 'Specific modules')
puts "Categories created successfully!"
puts "----------------------------------------------------------------------------------------------------------------"
puts "Creating lectures ..."
Lecture.create!(name: 'FR', description: 'French language course', category_id: Category.find_by(name: 'General branches').id)
Lecture.create!(name: 'POO1', description: 'Introduction to Object-Oriented Programming', category_id: Category.find_by(name: 'Specific modules').id)
Lecture.create!(name: 'POO2', description: 'Introduction to Object-Oriented Programming', category_id: Category.find_by(name: 'Specific modules').id)
Lecture.create!(name: 'SQL1', description: 'Introduction to MySQL databases', category_id: Category.find_by(name: 'Specific modules').id)
Lecture.create!(name: 'Stage', description: 'Professional internship', category_id: Category.find_by(name: 'Application modules and work experience').id)
puts "Lectures created successfully!"
puts "----------------------------------------------------------------------------------------------------------------"
puts "Creating promotions ..."

teacher = User.find_by(email: "ada.lovelace@cpnv.ch")

Promotion.create!(
  name: "Si-T2a",
  start_date: Date.parse("23/08/2019"),
  end_date: Date.parse("1/7/2021"),
  user_id: teacher.id
)

promotion = Promotion.create!(
  name: "Si-T2b",
  start_date: Date.parse("23/08/2020"),
  end_date: Date.parse("1/7/2022"),
  user_id: teacher.id
)

puts "Promotions created successfully!"
puts "----------------------------------------------------------------------------------------------------------------"
puts "Adding students to promotions..."


student1 = User.find_by(email: "rachel.green@cpnv.ch")

UserPromotion.create!(
  promotion_id: promotion.id,
  user_id: student1.id
)

puts "Students added successfully!"

puts "Creating semesters ..."
puts "----------------------------------------------------------------------------------------------------------------"


Semester.create!(name: 'S1')
Semester.create!(name: 'S2')
Semester.create!(name: 'S3')
Semester.create!(name: 'S4')

puts "Semesters created successfully!"
puts "----------------------------------------------------------------------------------------------------------------"

puts "Creating dispensed lecture ..."

promotion = Promotion.find_by(name: "Si-T2a")

lecture = Lecture.find_by(name: "POO1")

semester = Semester.find_by(name: "S1")

DispensedLecture.create!(
  user_id: teacher.id,
  promotion_id: promotion.id,
  lecture_id: lecture.id,
  semester_id: semester.id
)

# Recherche du cours POO2
lecture = Lecture.find_by(name: "POO2")

# Recherche du semestre S2
semester = Semester.find_by(name: "S2")

# Création d'une nouvelle entrée dans la table DispensedLectures
DispensedLecture.create!(
  user_id: teacher.id,
  promotion_id: promotion.id,
  lecture_id: lecture.id,
  semester_id: semester.id
)

puts "Dispensed lecture created successfully!"
puts "----------------------------------------------------------------------------------------------------------------"

puts "Creating grades ..."

puts "Creating grades ..."

teacher = User.find_by(email: "ada.lovelace@cpnv.ch")
student = User.find_by(email: "rachel.green@cpnv.ch")
dispensed_lecture = DispensedLecture.find_by(lecture_id: Lecture.find_by(name: "POO1").id, promotion_id: Promotion.find_by(name: "Si-T2a").id)

10.times do
  Grade.create!(
    name: "TE - #{Faker::Lorem.word}",
    result: rand(1.0..6.0),
    weight: rand(0.1..1.0),
    date: Date.today,
    student: student,
    teacher: teacher,
    dispensed_lecture: dispensed_lecture
  )
end

puts "Grades created successfully!"