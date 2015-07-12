require "active_support"
require "active_support/inflector"

# This module will be **extended** in all of my classes. It contains methods
# that will become **class** methods for the class.

module DatabaseClassMethods
  # creates a table with field names and types as provided
  #
  # field_names_and_types   - Array of the column names
  #
  # returns nothing or error message if fails
  def create_table(field_names_and_types)
    stringify = create_string_of_field_names_and_types(field_names_and_types)
    run_sql("CREATE TABLE IF NOT EXISTS #{table_name} (#{stringify});")
  end

  # returns a stringified version of this table, optimizied for SQL statements
  #
  # Example: 
  #           [["id", "integer"], ["name", "text"], ["grade", "integer"]]
  #        => "id INTEGER PRIMARY KEY, name TEXT, grade INTEGER" 
  #
  # field_names_and_types     - Array of Arrays of field names and their types - first Array assumed to be Primary key
  #
  # returns String
  def create_string_of_field_names_and_types(field_names_and_types)
    add_commas_to_types(field_names_and_types)
    add_primary_key_type_to_first_element(field_names_and_types)
    field_names_and_types.join(" ")
  end
  
  # utility method for create_string_of_field_names_and_types
  #
  # adds commas to the second dimension of the array
  def add_commas_to_types(field_names_and_types)
    field_names_and_types.each do |array|
      array[1] = array[1].upcase + ","
    end
  end
  
  # utility method for create_string_of_field_names_and_types
  #
  # adds commas to the second dimension of the array
  def add_primary_key_type_to_first_element(field_names_and_types)
    if !field_names_and_types.first[1].include?("PRIMARY KEY")
      field_names_and_types.first[1] = field_names_and_types.first[1].remove(/,/) + " PRIMARY KEY,"
    end
  end
  
  # meant to be written over in each class with a valid method
  # overwrite if you need to check if it exists as a foreign key in another table before deleting
  # 
  # returns Boolean
  def ok_to_delete?(id)
    true
  end
  
  # deletes the record matching the primary key
  #
  # key_id             - Integer of the value of the record you want to delete
  #
  # returns nothing
  def delete_record(id)
    if ok_to_delete?(id)
      CONNECTION.execute("DELETE FROM #{table_name} WHERE id = #{id};")
    else
      false
    end
  end

  # returns all records in database
  #
  # returns Array of a Hash of the resulting records
  def all
    self.as_objects(CONNECTION.execute("SELECT * FROM #{table_name};"))
  end
  
  
  # returns object if exists or false if not
  #
  # returns object or false
  def exists?(id)
    rec = CONNECTION.execute("SELECT * FROM #{table_name} WHERE id = #{id};").first
    if rec.nil?
      false
    else
      self.new(r)
    end
  end
  
  # retrieves a record matching the id
  #
  # returns the first object (should be only object)
  def create_from_database(id)
    rec = CONNECTION.execute("SELECT * FROM #{table_name} WHERE id = #{id};").first
    if rec.nil?
      self.new()
    else
      self.new(rec)
    end
  end
  
  # convert Hash records to Objects
  #
  # returns an Array of objects
  def as_objects(hashes)
    as_object = []
    hashes.each do |hash|
      as_object.push(self.new(hash))
    end
    as_object
  end

  # retrieves all records in this table where field name and field value have this relationship
  #
  # fieldname       - String of the field name in this table
  # field_value     - String or Integer of this field value in the table
  # relationship    - String of the relationship (ie: ==, >=, <=, !)
  #
  # returns an Array of hashes
  def where_match(field_name, field_value, relationship)
    self.as_objects(CONNECTION.execute("SELECT * FROM #{table_name} WHERE #{field_name} #{relationship} #{add_quotes_if_string(field_value)};"))
  end
  
  # returns an integer of the sum field where conditions are met
  #
  # returns an Integer or an error message
  def sum_field_where(sum_field, where_field, where_value, where_relationship)
    result = run_sql("SELECT SUM(#{sum_field}) FROM #{table_name} WHERE #{where_field} #{where_relationship} #{add_quotes_if_string(where_value)};")
    if result.is_a? Array
      result.first[0]
    else
      result
    end
  end
  
  # returns an Array of Hashes containing the field name information for the table
  #
  # returns an Array or false if SQL error
  def get_table_info
    run_sql("PRAGMA table_info(#{table_name});")
  end
  
  # if the value is a string, adds quotes
  #
  # returns value
  def add_quotes_if_string(value)
    if value.is_a? String
      value = add_quotes_to_string(value)
    end
    value
  end
  
  # adds '' quotes around a string for SQL statement
  #
  # Example: 
  #
  #        text
  #     => 'text'
  # 
  # string  - String
  #
  # returns a String
  def add_quotes_to_string(string)
    string = "'#{string}'"
  end
  
  # returns a String
  #
  # returns String
  def table_name
    self.to_s.pluralize.underscore
  end
  
  # intended to run SQL string and rescues any errors
  #
  # sql_query - String of the SQL query
  #
  # returns Array of SQL result or False if SQL error
  def run_sql(sql_query)
    begin
      CONNECTION.execute(sql_query)
    rescue Exception => msg
      msg
    end
  end
  
end