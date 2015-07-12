require "active_support"
require "active_support/inflector"

# This module will be **extended** in all of my classes. It contains methods
# that will become **class** methods for the class.

module DatabaseClassMethods
  # Get all of the rows for a table.
  #
  # Returns an Array containing Objects for each row.
  def all
    # Figure out the table's name from the class we're calling the method on.
    table_name = self.to_s.pluralize.underscore
    
    results = CONNECTION.execute("SELECT * FROM #{table_name}")

    results_as_objects = []
    
    results.each do |result_hash|
      results_as_objects << self.new(result_hash)
    end
    
    return results_as_objects
  end
  
  # Get a single row.
  #
  # record_id - The record's Integer ID.
  #
  # Returns an Object.
  def find(record_id)
    # Figure out the table's name from the class we're calling the method on.
    table_name = self.to_s.pluralize.underscore
    
    result = CONNECTION.execute("SELECT * FROM #{table_name} WHERE id = #{record_id}").first
    
    self.new(result)
  end
end