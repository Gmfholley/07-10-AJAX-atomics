require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"


class Task
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_reader :id, :errors
  attr_accessor :content, :done
  
  def initialize(task_options={})
    @id = task_options["id"]
    @content = task_options["content"]
    
    if task_options["done"].to_i == 0
      @done = false
    else
      @done = true
    end
    @errors=[]
  end
  
  # returns a String converting Boolean to English
  #
  # returns String
  def done_in_english
    if @done
      "done"
    else
      "undone"
    end
  end
  
  def database_field_names
    ["content"]
  end
  
  # Mark a task as "done" in the database.
  def mark_as_done
    CONNECTION.execute("UPDATE tasks SET done = 1 WHERE id = #{self.id}")
    self.done = true
  end
  
  # Mark a task as "done" in the database.
  def mark_as_undone
    CONNECTION.execute("UPDATE tasks SET done = 0 WHERE id = #{self.id}")
    self.done = false
  end
end