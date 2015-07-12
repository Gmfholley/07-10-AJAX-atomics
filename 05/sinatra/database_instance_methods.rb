require "active_support"
require "active_support/inflector"

# This module will be **extended** in all of my classes. It contains methods
# that will become **class** methods for the class.

module DatabaseInstanceMethods

  # checks if this object has been saved to the database yet
  #
  # returns Boolean
  def saved_already?
    @id != "" && @id != nil
  end

  # meant to be written over in each class with a valid method
  # default method just checks database field requirements vs. what the type is (NULL, integers)
  #
  # returns Boolean
  def valid?
    validate_field_types
    @errors.length == 0
  end

  # creates a new record in the table for this object
  #
  # returns Integer or false
  def save_record
    if !saved_already?
      if valid?
        run_sql("INSERT INTO #{table} (#{string_field_names}) VALUES (#{stringify_self});")
        @id = CONNECTION.last_insert_row_id
      else
        false
      end
    else
      update_record
    end
  end

  # updates all values (except ID) in the record
  #
  # returns false if not saved
  def update_record 
    if valid?
      query_string = "UPDATE #{table} SET #{parameters_and_values_sql_string} WHERE id = #{@id};"
      run_sql(query_string)
      @id
    else
      false
    end
  end

  # updates the field of one column if records meet criteria
  #
  # change_field            - String of the change field
  # change_value            - Value (Integer or String) to change in the change field
  #
  # returns fales if not saved
  def update_field(change_field, change_value)
    if valid?
      run_sql("UPDATE #{table} SET #{change_field} = #{self.class.add_quotes_if_string(change_value)} WHERE id = #{@id};")
    else
      false
    end
  end

end