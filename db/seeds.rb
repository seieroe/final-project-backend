# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Coder.delete_all
Client.delete_all
Project.delete_all
Assignment.delete_all

admin = User.create(name: 'emily')

emily = Coder.create(name: 'emily seieroe', language: 'react')
linya = Coder.create(name: 'linya hu', language: 'javascript')
sivan = Coder.create(name: 'sivan adler', language: 'rails')
katie = Coder.create(name: 'katie pennachio', language: 'javascript')
leo = Coder.create(name: 'leonardo jimenez', language: 'python')
quinn = Coder.create(name: 'quinn shanahan', language: 'python')
masha = Coder.create(name: 'masha antropova', language: 'python')
brian = Coder.create(name: 'brian jones', language: 'python')
sage = Coder.create(name: 'sage mcgill', language: 'react')
selin = Coder.create(name: 'selin cetinkaya', language: 'python')
david = Coder.create(name: 'david floyd', language: 'react')

intersection = Client.create(name: 'Intersection', website:'https://www.intersection.com/')
lagcc = Client.create(name: 'LAGCC', website:'https://www.laguardia.edu/home/Default.aspx')
gateway = Client.create(name: 'Gateway Center', website:'http://shopgatewaycenterbrooklyn.com/')
cancercare = Client.create(name: 'CancerCare', website:'https://www.cancercare.org/')

ccsm = Project.create(name: 'support and maintenance', user_id: admin.id, client_id: cancercare.id)
ccrefactor = Project.create(name: 'refactoring project', user_id: admin.id, client_id: cancercare.id)
redbullad = Project.create(name: 'redbull ad', user_id: admin.id, client_id: intersection.id)
lsa = Project.create(name: 'load shedding agent', user_id: admin.id, client_id: lagcc.id)
catransit = Project.create(name: 'chicago transit', user_id: admin.id, client_id: intersection.id)
gatewaykiosks = Project.create(name: 'kiosk replacements', user_id: admin.id, client_id: gateway.id)

Assignment.create(name: 'emily-ccsm project', project_id: ccsm.id, coder_id: emily.id)
Assignment.create(name: 'linya-ccsm project', project_id: ccsm.id, coder_id: linya.id)
Assignment.create(name: 'leo-refactoring project', project_id: ccrefactor.id, coder_id: leo.id)
Assignment.create(name: 'emily-kiosk replacements', project_id: gatewaykiosks.id, coder_id: emily.id)
Assignment.create(name: 'emily-load shedding agent', project_id: lsa.id, coder_id: emily.id)
