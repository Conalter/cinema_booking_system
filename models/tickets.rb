require_relative("../db/sql_runner")


  class Ticket

    attr_reader :id
    attr_writer :customer_id, :films_id

    def initialize(options)
      @id = options['id'].to_i if options['id']
      @customer_id = options['customer_id'].to_i
      @film_id = options['film_id'].to_i
    end

    def self.all()
      sql = "SELECT * FROM tickets"
      ticket = SqlRunner.run(sql)
      result = Ticket.map {|tickets| Tickets.new(tickets)}
      return result
    end

    def save()
      sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id;"
      values = [@customer_id, @film_id]
      result = SqlRunner.run(sql, values).first
      id = result['id'].to_i
    end

    def self.delete_all()
      sql = "DELETE FROM tickets"
      values = []
      SqlRunner.run(sql, values)
    end

  end
