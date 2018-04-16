require_relative("../db/sql_runner")

class Film

  attr_reader :id
  attr_writer :title, :price

  def initialize(options)
    @id = (options)['id'].to_i
    @title = (options)['title']
    @price = (options)['price']
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id;"
    values = [@title, @price]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM films'
    values =[]
    film = SqlRunner.run(sql, values)
    result = Films.map_film(film)
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run(sql, values)
  end

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id WHERE tickets.film_id = $1;"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    return customers.map {|customers_hash| Customer.new(customers_hash)}
  end

  def customer_count
    customers.count
  end

  def self.map_films(film_data)
    return film_data.map {|film| Film.new(film)}
  end

end
