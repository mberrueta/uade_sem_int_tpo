organization1 = Organization.find_or_create_by(
  id: 1,
  name: 'High school musical',
  phone: '1-581-511-0561 x91585',
  address: '32620 Abshire Terrace, East Sandyshire, MT 25303',
  email: 'samellaheaney@kovacekcarroll.io',
  web_page: 'http://jerde.com/aleen',
  logo: 'http://christiansen.com/michel'
)

academic_calendar = AcademicCalendar.find_or_create_by(
  id: 1,
  year: 2019,
  calendar_type: 'morning',
  organization_id: 1
)

course = Course.find_or_create_by(
  id: 1,
  academic_calendar_id: 1,
  name: '1A',
  max_students: 100
)

subject1 = Subject.find_or_create_by(
    id: 1,
    course_id: 1,
    name: 'Matematicas 1A'
)

subject2 = Subject.find_or_create_by(
    id: 2,
    course_id: 1,
    name: 'Literatura 1A'
)

subject3 = Subject.find_or_create_by(
    id: 3,
    course_id: 1,
    name: 'Historia 1A'
)

subject4 = Subject.find_or_create_by(
    id: 4,
    course_id: 1,
    name: 'Naturales 1A'
)