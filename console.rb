require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

require( 'pry-byebug' )

customer1 = Customer.new({'name' => 'Larry McDavid', 'funds' => 100})
customer1.save()
customer2 = Customer.new({'name' => 'Jonny Greenwood', 'funds' => 80})
customer2.save()
customer3 = Customer.new({'name' => 'Gregory Smith-Halystate-McDuff III', 'funds' => 60})
customer3.save()
customer4 = Customer.new({'name' => 'Evelyn Soritly', 'funds' => 40})
customer4.save()
customer5 = Customer.new({'name' => 'Kelly Donnyson', 'funds' => 20})
customer5.save()
customer6 = Customer.new({'name' => 'Frank Ocean', 'funds' => 30})
customer6.save()

film1 = Film.new({'title' => 'Casablanca', 'price' => 20})
film1.save()
film2 = Film.new({'title' => 'Apocalypse Now', 'price' => 20})
film2.save()
film3 = Film.new({'title' => 'There Will Be Blood', 'price' => 10})
film3.save()
film4 = Film.new({'title' => 'Three Billboards Outside Ebbing, Missouri', 'price' => 20})
film4.save()
film5 = Film.new({'title' => 'Akira', 'price' => 10})
film5.save()
film6 = Film.new({'title' => 'Birdman', 'price' => 20})
film6.save()

ticket1 = Ticket.new({'customer_id' => customer5.id, 'film_id' => film4.id})
ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})
ticket2.save()
ticket3 = Ticket.new({'customer_id' => customer6.id, 'film_id' => film3.id})
ticket3.save()
ticket4 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film1.id})
ticket4.save()
ticket5 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film6.id})
ticket5.save()
ticket6 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film5.id})
ticket6.save()
ticket7 = Ticket.new({'customer_id' => customer4.id, 'film_id' => film5.id})
ticket7.save()
ticket8 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film5.id})
ticket8.save()

binding.pry
nil