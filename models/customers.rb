require_relative('../db/sql_runner')
require_relative('films.rb')
require_relative('tickets.rb')

class Customer

  attr_reader :id
  attr_writer :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds']
  end
2
  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    values = []
    customer = SqlRunner.run(sql, values)
    result = Customer.map_customers(customers)
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE tickets.customer_id = $1;"
    values = [@id]
    film = SqlRunner.run(sql, values)
    return film.map {|films_hash| Film.new(films_hash)}
  end

  def film_count
    films.count
  end

  def self.map_films(film_data)
    return film_data.map {|film| Film.new(film)}
  end

  def price_of_admission
    return {|customer_funds|[0]
  end

end
