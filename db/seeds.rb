organization1 = Organization.find_or_create_by(
  id: 'e4408bc6-e468-4749-a9b2-9af9249be1e4',
  name: 'High school musical',
  phone: '1-581-511-0561 x91585',
  address: '32620 Abshire Terrace, East Sandyshire, MT 25303',
  email: 'samellaheaney@kovacekcarroll.io',
  web_page: 'http://jerde.com/aleen',
  logo: 'http://christiansen.com/michel'
)

academic_calendar = AcademicCalendar.find_or_create_by(
  id: '1c548e4c-6d3b-413e-bd3d-d92a81c1d087',
  year: 2019,
  calendar_type: 'morning',
  organization_id: organization1.id
)

course = Course.find_or_create_by(
  id: '40a4b6cf-00d7-497b-9fe3-4803e54c3f54',
  academic_calendar_id: academic_calendar.id,
  name: '1A',
  max_students: 100
)

subject = Subject.find_or_create_by(
    id: 'd54cd933-1f04-420a-b0d3-2970ac5e1c6c',
    course: course,
    name: 'Matematicas 1A'
)

Subject.find_or_create_by(
    id: 'db697d7e-6631-4f99-aac4-3d5f6817e12f',
    course: course,
    name: 'Literatura 1A'
)

Subject.find_or_create_by(
    id: '95fc0e20-5d9e-4585-b12b-e6b73f0d5004',
    course: course,
    name: 'Historia 1A'
)

Subject.find_or_create_by(
    id: 'd26acd74-c7f8-4df2-958a-1f2f48917361',
    course: course,
    name: 'Naturales 1A'
)

student = Student.find_or_create_by(
  id: "53d47de0-5b38-4b19-8e78-436c5ac6693e",
  first_name: "Logan",
  last_name: "Carroll",
  phone: "(385) 091-6611",
  address: "Apt. 324 6592 Schneider Camp, West Santofurt, TN 61450",
  email: "trulapagac@walter.io",
  gender: :male,
  picture_url: nil,
  organization: organization1
)
Student.find_or_create_by(
  id: "2b3186c3-83f7-4499-a312-e0789a0b7b10",
  first_name: "Latrina",
  last_name: "Kerluke",
  phone: "(203) 973-4658",
  address: "Apt. 455 6748 Phillip Ports, Port Porfiriofort, VA 88130",
  email: "soniaheller@feilcronin.co",
  gender: :female,
  picture_url: nil,
  organization: organization1
)
Student.find_or_create_by(
    id: "37dc0193-1f85-4b0e-919f-0276b108049f",
  first_name: "Rosita",
  last_name: "Wunsch",
  phone: "1-531-586-9541 x31588",
  address: "401 Daniel Haven, North Dexterton, MN 66583-4606",
  email: "elaynemetz@grimes.name",
  gender: :female,
  picture_url: nil,
  organization: organization1
)

Parent.find_or_create_by(
  id: "0140a3b0-cfdd-4239-9460-9d03ccc10679",
  first_name: "Smitham",
  last_name: "Friesen",
  phone: "325-905-6397",
  address: "Apt. 611 1464 Donnell Tunnel, East Cecilburgh, MI 26408",
  email: "gabrielelangosh@farrell.org",
  gender: :female,
  picture_url: nil,
  organization: organization1,
  student_ids: %w(53d47de0-5b38-4b19-8e78-436c5ac6693e 2b3186c3-83f7-4499-a312-e0789a0b7b10)
)

Parent.find_or_create_by(
  id: "3110c6ca-1d92-4edd-a6fa-f12d93181663",
  first_name: "Mohamed",
  last_name: "Spencer",
  phone: "164.887.4187",
  address: "9225 Treutel Ford, South Tara, IA 02245",
  email: "gudy@bashirian.co",
  gender: :female,
  picture_url: nil,
  organization: organization1,
  student_ids: %w(37dc0193-1f85-4b0e-919f-0276b108049f)
)

program = Program.find_or_create_by(
  id: "8ce7e4ae-606f-4a9f-ac06-d215c3cefb52",
  subject: subject,
  day: 'Wed, 08 May 2019',
  done: false,
  class_number: 1
)

Topic.find_or_create_by(
  id: "f358567b-7f87-4839-a960-2dcef94554b0",
  program: program,
  title: "Marcos Sanford II",
  description: nil
)

exam = Exam.find_or_create_by(
  id: "05107a51-85ec-42ed-8a76-cd7f89dc2447",
  title: "Ming Murphy",
  subject: subject
)

Exam.find_or_create_by(
  id: "d9693e26-d248-49fb-85dd-e2af68aa7bf2",
  title: "Mike Hammes",
  subject: subject
)

Exam.find_or_create_by(
  id: "cfdd960d-c313-4bc6-96a0-d4e583f79f74",
  title: "Carmelo Conroy",
  subject: subject
)

ExamQuestion.find_or_create_by(
  id: "4d770bfb-b81a-49f0-8be6-bb5d47982f0b",
  exam: exam,
  question: "Lowell Stroman",
).tap do |eq|
    eq.options = ["Isiah Torphy", "Deon Bartoletti", "Talisha Koch", "Stanton Gusikowski"]
    eq.save!
end


ExamQuestion.find_or_create_by(
  id: "f22214c2-4387-43d5-a73b-81ad6e3425b3",
  exam: exam,
  question: "Cristopher Upton",
).tap do |eq|
    eq.options = ["Ayako Hoeger", "Leo Doyle Jr.", "Dee Brakus", "Elisha Lang"]
    eq.save!
end


ExamQuestion.find_or_create_by(
  id: "4b6bff54-9be2-450a-9436-20147dbffc31",
  exam: exam,
  question: "Miss Tijuana Schaefer",
).tap do |eq|
    eq.options = ["Delilah Leffler", "Floyd Lakin", "Caron Carter", "Modesto Hackett Jr."]
    eq.save!
  end
