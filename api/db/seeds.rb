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
  type: 'morning'
)
