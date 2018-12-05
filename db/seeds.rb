organization1 = Organization.find_or_create_by(
  id: 'e4408bc6-e468-4749-a9b2-9af9249be1e4',
  name: 'Instituto Industrial Luis A. Huergo',
  phone: '54-4362-9964 ',
  address: 'Perú 759 C1068AAE Ciudad de Buenos Aires, San Telmo',
  email: 'info@huergo.edu.ar',
  web_page: 'http://huergo.edu.ar/infoinstitucional.html',
  logo: 'http://huergo.edu.ar/images/logohuergo.png'
)

academic_calendar = AcademicCalendar.find_or_create_by(
  id: '1c548e4c-6d3b-413e-bd3d-d92a81c1d087',
  year: 2019,
  calendar_type: 'morning',
  organization_id: organization1.id
)

course1 = Course.find_or_create_by(
  id: '40a4b6cf-00d7-497b-9fe3-4803e54c3f54',
  academic_calendar_id: academic_calendar.id,
  name: '1A',
  max_students: 60
)

course2 = Course.find_or_create_by(
  id: 'f88e054d-aa51-4e1f-81fb-7cb5d41ec03f',
  academic_calendar_id: academic_calendar.id,
  name: '2A',
  max_students: 60
)

course3 = Course.find_or_create_by(
  id: '7121b6e8-ccd5-4d5f-8f91-cabb689c4685',
  academic_calendar_id: academic_calendar.id,
  name: '1B',
  max_students: 60
)

course4 = Course.find_or_create_by(
  id: 'cd2bd538-fd9c-4081-bada-e0d06d7f6b78',
  academic_calendar_id: academic_calendar.id,
  name: '2B',
  max_students: 60
)


teacher1 = Teacher.find_or_create_by(
  id: "2200ba65-4679-4cf1-a7a0-2506d79ca64d",
  first_name: "Wallace",
  last_name: "Kris",
  phone: "(291) 189-0307 x854",
  address: "Apt. 986 341 Valentin Points, South Marianneshire, MD 49411",
  email: "gudy@bashirian.co",
  gender: :male,
  picture_url: nil,
  organization: organization1,
  dni: 40000017
)

teacher2 = Teacher.find_or_create_by(
  id: "e558b184-b7ce-4427-9e72-bbf7f60b532f",
  first_name: "Maggio",
  last_name: "Spencer",
  phone: "1-211-606-6549",
  address: "uite 764 492 Tristan Mountains, McKenzieville, KS 43207",
  email: "antoniowiegand@lemke.name",
  gender: :female,
  picture_url: nil,
  organization: organization1,
  dni: 40000018
)

teacher3 = Teacher.find_or_create_by(
  id: "5d39a2c6-9c5e-4f18-8f40-078fd22ab510",
  first_name: "Brisha",
  last_name: "Torres",
  phone: "(011) 4674-3129",
  address: "San Pedro 3943",
  email: "Brisha.Torres@will.net",
  gender: :female,
  picture_url: nil,
  organization: organization1,
  dni: 40000019
)

teacher4 = Teacher.find_or_create_by(
  id: "97f9daa7-98fd-4c41-ab71-4f032455e76b",
  first_name: "Anselmo",
  last_name: "Castro",
  phone: "(0223) 475-3933",
  address: "Av Independencia 3850",
  email: "Anselmo.Castro@lemke.name",
  gender: :male,
  picture_url: nil,
  organization: organization1,
  dni: 40000020
)

teacher5 = Teacher.find_or_create_by(
  id: "acd75fb8-795d-46e9-97e9-e290f8485ed2",
  first_name: "Charo",
  last_name: "Guzman",
  phone: "(011) 4669-2573",
  address: "Caupolicán 4711",
  email: "Charo.Guzman@will.net",
  gender: :female,
  picture_url: nil,
  organization: organization1,
  dni: 40000021
)

teacher6 = Teacher.find_or_create_by(
  id: "3ef301cc-ff2f-4c3d-a4d7-2488f85d3db2",
  first_name: "Fraco",
  last_name: "Cruz",
  phone: "(011) 4545-3500",
  address: "Núñez 5165",
  email: "Fraco.Cruz@lemke.name",
  gender: :male,
  picture_url: nil,
  organization: organization1,
  dni: 40000022
)

teacher7 = Teacher.find_or_create_by(
  id: "a1da08c0-0eb8-4725-a2a0-dc7496e51dcf",
  first_name: "Gil",
  last_name: "Rossi",
  phone: "(0351) 423-1292",
  address: "Sucre 95",
  email: "Gil.Rossi@will.net",
  gender: :male,
  picture_url: nil,
  organization: organization1,
  dni: 40000023
)

teacher8 = Teacher.find_or_create_by(
  id: "0e22036d-3abb-4f91-97bc-dc6527e24669",
  first_name: "Mauricio",
  last_name: "Fiorentino",
  phone: "(02627) 42-2121",
  address: "Cte Salas 287",
  email: "Mauricio.Fiorentino@lemke.name",
  gender: :male,
  picture_url: nil,
  organization: organization1,
  dni: 40000024
)

subject1 = Subject.find_or_create_by(
  id: '3ee74a9c-7f9b-44f3-aef4-aa355f2a020c',
  course: course1,
  teacher: teacher1,
  name: 'Matematicas 1A'
)

subject2 = Subject.find_or_create_by(
  id: 'de2a2a1b-d3c4-4cb1-ab04-475a35c511cd',
  course: course1,
  teacher: teacher2,
  name: 'Literatura 1A'
)

subject3 = Subject.find_or_create_by(
  id: '95fc0e20-5d9e-4585-b12b-e6b73f0d5004',
  course: course1,
  teacher: teacher3,
  name: 'Historia 1A'
)

subject4 = Subject.find_or_create_by(
  id: 'd26acd74-c7f8-4df2-958a-1f2f48917361',
  course: course1,
  teacher: teacher4,
  name: 'Naturales 1A'
)

subject5 = Subject.find_or_create_by(
  id: 'd54cd933-1f04-420a-b0d3-2970ac5e1c6c',
  course: course2,
  teacher: teacher5,
  name: 'Matematicas 1B'
)

subject6 = Subject.find_or_create_by(
  id: 'db697d7e-6631-4f99-aac4-3d5f6817e12f',
  course: course2,
  teacher: teacher6,
  name: 'Literatura 1B'
)

subject7 = Subject.find_or_create_by(
  id: 'adc2f1b9-51c2-4a27-a29e-e91cd0e2c613',
  course: course2,
  teacher: teacher7,
  name: 'Historia 1B'
)

subject8 = Subject.find_or_create_by(
  id: '548457ad-fd04-4d5f-bde0-2777f64f0c2e',
  course: course2,
  teacher: teacher8,
  name: 'Naturales 1B'
)

subject9 = Subject.find_or_create_by(
  id: '4017cae3-a128-485a-a304-70bf20c9e49d',
  course: course3,
  teacher: teacher1,
  name: 'Matematicas II 2A'
)

subject10 = Subject.find_or_create_by(
  id: 'b4d0d36c-96e0-48ae-97b6-196c41d13961',
  course: course3,
  teacher: teacher2,
  name: 'Literatura II 2A'
)

subject11 = Subject.find_or_create_by(
  id: '7b352a54-7a4c-43e4-95bf-84dbe949aa5d',
  course: course3,
  teacher: teacher3,
  name: 'Historia II 2A'
)

subject12 = Subject.find_or_create_by(
  id: 'a633a5a6-0adb-4cdd-8deb-40f0d64f30e5',
  course: course3,
  teacher: teacher4,
  name: 'Naturales II 2A'
)

subject13 = Subject.find_or_create_by(
  id: '53cf0577-4314-4e70-bd9f-a0ca85bd97a2',
  course: course4,
  teacher: teacher5,
  name: 'Matematicas 2 2B'
)

subject14 = Subject.find_or_create_by(
  id: '278e5a44-ae17-4f11-85b7-b0d9311a96a1',
  course: course4,
  teacher: teacher6,
  name: 'Literatura 2 2B'
)

subject15 = Subject.find_or_create_by(
  id: 'fba8fc02-ced5-4ab0-af35-aa4cb88445ce',
  course: course4,
  teacher: teacher7,
  name: 'Historia 2 2B'
)

subject16 = Subject.find_or_create_by(
  id: '8e180be2-8bfd-42ea-9c05-cde3b6ea5648',
  course: course4,
  teacher: teacher8,
  name: 'Naturales 2 2B'
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
  organization: organization1,
  course: course1,
  dni: 40000000
)
student2 = Student.find_or_create_by(
  id: "2b3186c3-83f7-4499-a312-e0789a0b7b10",
  first_name: "Latrina",
  last_name: "Kerluke",
  phone: "(203) 973-4658",
  address: "Apt. 455 6748 Phillip Ports, Port Porfiriofort, VA 88130",
  email: "soniaheller@feilcronin.co",
  gender: :female,
  picture_url: nil,
  organization: organization1,
  course: course1,
  dni: 40000001
)
student3 = Student.find_or_create_by(
  id: "37dc0193-1f85-4b0e-919f-0276b108049f",
  first_name: "Rosita",
  last_name: "Wunsch",
  phone: "1-531-586-9541 x31588",
  address: "401 Daniel Haven, North Dexterton, MN 66583-4606",
  email: "elaynemetz@grimes.name",
  gender: :female,
  picture_url: nil,
  organization: organization1,
  course: course1,
  dni: 40000002
)

student4 = Student.find_or_create_by(
  id: "a0b96df6-8cac-4945-ac1a-ff2521ae39ce",
  first_name: "Rayman ",
  last_name: "Cordero",
  phone: "(011) 4371-0778",
  address: "Viamonte 1450",
  email: "trulapagac@walter.io",
  gender: :male,
  picture_url: nil,
  organization: organization1,
  course: course1,
  dni: 40000003
)
student5 = Student.find_or_create_by(
  id: "a38c36a7-78d7-4e27-aaa3-44a928cff06a",
  first_name: "Amadeo" ,
  last_name: "DeRose",
  phone: "(02317) 43-0842",
  address: "Mitre 1310",
  email: "soniaheller@feilcronin.co",
  gender: :male,
  picture_url: nil,
  organization: organization1,
  course: course2,
  dni: 40000004
)
student6 = Student.find_or_create_by(
  id: "f4bf7ae4-af6e-442e-a067-556a80c19b3d",
  first_name: "Cidro",
  last_name: "Juarez",
  phone: "(02227) 49-1051",
  address: "Mitre 2054",
  email: "elaynemetz@grimes.name",
  gender: :male,
  picture_url: nil,
  organization: organization1,
  course: course2,
  dni: 40000005
)

student7 = Student.find_or_create_by(
  id: "94985517-cc2e-4c00-9d84-7e7997f54356",
  first_name: "Gervasio",
  last_name: "Conti",
  phone: "(011) 4454-4500",
  address: "J E PEDERNERA 1558",
  email: "trulapagac@walter.io",
  gender: :male,
  picture_url: nil,
  organization: organization1,
  course: course2,
  dni: 40000006
)
student8 = Student.find_or_create_by(
  id: "8b70123a-7d5a-4501-9bb5-376edd9f2159",
  first_name: "Lorenzo",
  last_name: "Lopez",
  phone: "(011) 4209-5150",
  address: "Liniers 2758",
  email: "soniaheller@feilcronin.co",
  gender: :female,
  picture_url: nil,
  organization: organization1,
  course: course2,
  dni: 40000007
)
student9 = Student.find_or_create_by(
  id: "56419c72-ef91-4cc8-b63a-af12f3292d04",
  first_name: "Madeira ",
  last_name: "Scalabrini",
  phone: "(011) 4922-5279",
  address: "Puán 1553",
  email: "elaynemetz@grimes.name",
  gender: :female,
  picture_url: nil,
  organization: organization1,
  course: course3,
  dni: 40000008
)

student10 = Student.find_or_create_by(
  id: "b3c72763-25a1-43e2-baf2-6d1611c03508",
  first_name: "Lucita",
  last_name: "Rojas",
  phone: "(011) 4855-2929",
  address: "Humahuaca 4425",
  email: "trulapagac@walter.io",
  gender: :female,
  picture_url: nil,
  organization: organization1,
  course: course3,
  dni: 40000009
)
student11 = Student.find_or_create_by(
  id: "510a9dbd-213a-4025-999a-120ab1d7e589",
  first_name: "Cristos",
  last_name: "Devia",
  phone: "(0379) 442-8198",
  address: "Av J R Vidal 1751",
  email: "soniaheller@feilcronin.co",
  gender: :male,
  picture_url: nil,
  organization: organization1,
  course: course3,
  dni: 400000010
)
student12 = Student.find_or_create_by(
  id: "5570fad5-af46-454f-924a-66879f59848f",
  first_name: "Jerrold",
  last_name: "Endrizzi",
  phone: "(0221) 483-7009",
  address: "Jose marmol 1035",
  email: "elaynemetz@grimes.name",
  gender: :male,
  picture_url: nil,
  organization: organization1,
  course: course3,
  dni: 40000011
)

student13 = Student.find_or_create_by(
  id: "0d2018df-5591-4b68-a6c8-bc6e51e4fd6c",
  first_name: "Baltasar",
  last_name: "Bregmann",
  phone: "(011) 4567-0133",
  address: "Baigorria 4540",
  email: "trulapagac@walter.io",
  gender: :male,
  picture_url: nil,
  organization: organization1,
  course: course4,
  dni: 40000012
)
student14 = Student.find_or_create_by(
  id: "a16ab3fc-ab0a-401d-8ce4-07f50336b4f1",
  first_name: "Latrina",
  last_name: "Kerluke",
  phone: "(203) 973-4658",
  address: "Apt. 455 6748 Phillip Ports, Port Porfiriofort, VA 88130",
  email: "soniaheller@feilcronin.co",
  gender: :female,
  picture_url: nil,
  organization: organization1,
  course: course4,
  dni: 40000013
)
student15 = Student.find_or_create_by(
  id: "06a839fe-151c-46b7-8479-051c8f4d93c5",
  first_name: "Aldo",
  last_name: "Juarez",
  phone: "(011) 4200-8873",
  address: "Cno Gral Belgrano 4473",
  email: "elaynemetz@grimes.name",
  gender: :male,
  picture_url: nil,
  organization: organization1,
  course: course4,
  dni: 40000014
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
  student_ids: %w(53d47de0-5b38-4b19-8e78-436c5ac6693e 2b3186c3-83f7-4499-a312-e0789a0b7b10),
  dni: 40000015
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
  student_ids: %w(37dc0193-1f85-4b0e-919f-0276b108049f),
  dni: 40000016
)

lesson = Lesson.find_or_create_by(
  id: "67e5f2be-af30-4f4d-b709-77b83656d0c7",
  subject: subject3,
  date: 'Wed, 08 May 2019',
  done: false,
  title: 'Inicio de la primer guerra mundial',
  description: '',
  picture_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrXY3vnXt16WGcCgDmhzVTHlZUKcQz_q6C2pcnuaEH64et74yI',
  class_number: 1
)

lesson1 = Lesson.find_or_create_by(
  id: "ea2ba1c4-7d3a-4197-97dd-38b3c6d2452f",
  subject: subject3,
  date: 'Wed, 12 May 2019',
  done: false,
  title: 'Fases de la primer guerra mundial',
  description: '',
  picture_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdmKhOXBRnXmULrhjDB7I-RNfQJapafmuYOJeybwZb9wLAaVvuIQ',
  class_number: 2
)

lesson2 = Lesson.find_or_create_by(
  id: "05102142-cc75-467f-9fbf-c35a8f891654",
  subject: subject3,
  date: 'Wed, 15 May 2019',
  done: false,
  title: 'Fin de la primer guerra mundial',
  description: '',
  picture_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR-_WSg7RaReCbOo5zkiUrRzymuz6jSEXoUlGiqNo-IQ4P_8PloA',
  class_number: 3
)

lesson3 = Lesson.find_or_create_by(
  id: "81d5c87d-4bd8-458b-a319-08364ba3c001",
  subject: subject3,
  date: 'Wed, 15 May 2019',
  done: false,
  title: 'Consecuencias de la primer guerra mundial',
  description: '',
  picture_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrAheM4tolDp2bCeTh-E_p94JWqKVG4aMvYYpFu1uXtvW4Ee88mg',
  class_number: 3
)

lesson4 = Lesson.find_or_create_by(
  id: "8a276dc0-a27e-44aa-896d-30711b676f21",
  subject: subject1,
  date: 'Wed, 08 May 2019',
  done: false,
  title: 'Números naturales',
  description: '',
  picture_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrXY3vnXt16WGcCgDmhzVTHlZUKcQz_q6C2pcnuaEH64et74yI',
  class_number: 1
)

lesson5 = Lesson.find_or_create_by(
  id: "8dd54f43-6af3-4f1e-a802-0ec85e6419fe",
  subject: subject1,
  date: 'Wed, 12 May 2019',
  done: false,
  title: 'Números enteros',
  description: '',
  picture_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdmKhOXBRnXmULrhjDB7I-RNfQJapafmuYOJeybwZb9wLAaVvuIQ',
  class_number: 2
)

lesson6 = Lesson.find_or_create_by(
  id: "c1ff4562-d772-44de-a10f-b0e11cfe8792",
  subject: subject1,
  date: 'Wed, 15 May 2019',
  done: false,
  title: 'Números naturales. Combinatoria',
  description: '',
  picture_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR-_WSg7RaReCbOo5zkiUrRzymuz6jSEXoUlGiqNo-IQ4P_8PloA',
  class_number: 3
)

lesson7 = Lesson.find_or_create_by(
  id: "e3384730-2e54-4acd-a11a-a555bc10e613",
  subject: subject1,
  date: 'Wed, 15 May 2019',
  done: false,
  title: 'Números racionales',
  description: '',
  picture_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrAheM4tolDp2bCeTh-E_p94JWqKVG4aMvYYpFu1uXtvW4Ee88mg',
  class_number: 3
)

Topic.find_or_create_by(
  id: "59bb41e8-cea7-4ef6-bf82-c058e21b9524",
  lesson: lesson,
  title: "Causas de la Primera Guerra Mundial",
  description: nil
)

Topic.find_or_create_by(
  id: "d7684532-f488-44cc-9b00-258f41b9cc3d",
  lesson: lesson,
  title: "El inicio de la gran guerra",
  description: nil
)

Topic.find_or_create_by(
  id: "1dd29f65-1e8a-4554-95fb-ca5430399641",
  lesson: lesson,
  title: "Desarrollo de la guerra",
  description: nil
)

exam = Exam.find_or_create_by(
  id: "05107a51-85ec-42ed-8a76-cd7f89dc2447",
  title: "Ming Murphy",
  lesson: lesson
)

Exam.find_or_create_by(
  id: "d9693e26-d248-49fb-85dd-e2af68aa7bf2",
  title: "Mike Hammes",
  lesson: lesson1
)

Exam.find_or_create_by(
  id: "cfdd960d-c313-4bc6-96a0-d4e583f79f74",
  title: "Carmelo Conroy",
  lesson: lesson2
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

Attendance.find_or_create_by(
  id: 'e32706a9-81c6-4d03-8b26-bdcd81fce04f',
  course: course1,
  student: student,
  date: '2018-10-28',
  present_code: 'full'
)
Attendance.find_or_create_by(
  id: 'c8534b10-9ff9-4b88-8715-fe279b8b1ac4',
  course: course1,
  student: student,
  date: '2018-10-29',
  present_code: 'full'
)
Attendance.find_or_create_by(
  id: '19002f55-130d-4c4e-af85-11337baaadb3',
  course: course1,
  student: student,
  date: '2018-10-30',
  present_code: 'full'
)

Attendance.find_or_create_by(
  id: '13b601cb-fce6-4006-9e6a-cdee00dd20df',
  course: course1,
  student: student2,
  date: '2018-10-28',
  present_code: 'full'
)
Attendance.find_or_create_by(
  id: 'd3cb747e-edec-4559-ba0b-0365f2627f79',
  course: course1,
  student: student2,
  date: '2018-10-29',
  present_code: 'full'
)
Attendance.find_or_create_by(
  id: 'c75e85e5-fcb1-4c8f-a39e-e20172006d7f',
  course: course1,
  student: student2,
  date: '2018-10-30',
  present_code: 'half'
)

Attendance.find_or_create_by(
  id: '2f2fc2de-23d0-4f10-9972-25c29962cf97',
  course: course1,
  student: student3,
  date: '2018-10-28',
  present_code: 'full'
)
Attendance.find_or_create_by(
  id: '4d0a102e-9797-493a-b332-b3205a10c436',
  course: course1,
  student: student3,
  date: '2018-10-30',
  present_code: 'full'
)
