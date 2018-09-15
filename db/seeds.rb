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

subject1 = Subject.find_or_create_by(
    id: 'd54cd933-1f04-420a-b0d3-2970ac5e1c6c',
    course_id: course.id,
    name: 'Matematicas 1A'
)

subject2 = Subject.find_or_create_by(
    id: 'db697d7e-6631-4f99-aac4-3d5f6817e12f',
    course_id: course.id,
    name: 'Literatura 1A'
)

subject3 = Subject.find_or_create_by(
    id: '95fc0e20-5d9e-4585-b12b-e6b73f0d5004',
    course_id: course.id,
    name: 'Historia 1A'
)

subject4 = Subject.find_or_create_by(
    id: 'd26acd74-c7f8-4df2-958a-1f2f48917361',
    course_id: course.id,
    name: 'Naturales 1A'
)