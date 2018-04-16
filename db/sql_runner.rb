require('pg')
# class title
class SqlRunner
# title of method
  def self.run( sql, values = [] )
    # what the runner preforms:
    begin
      # 'postgress' is the database and this is how to access it
      db = PG.connect({ dbname: 'bookings', host: 'localhost' })
      # telling the database to prepare the paramaters query + sql
      db.prepare("query", sql)
      # the result should be equal to the these values
      result = db.exec_prepared( "query", values )
    # make sure this happens:
    ensure
      # no matter what happens, ensure the database closes even if the result does not equal nil
      db.close() if db != nil
    end
    # return the result of self.run
    return result
  end

end
