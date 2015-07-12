require_relative "../database_class_methods.rb"

class Task
  extend DatabaseClassMethods
  
  attr_reader :id
  attr_accessor :content, :done
  
  def initialize(task_options={})
    @id = task_options["id"]
    @content = task_options["content"]
    
    if task_options["done"].to_i == 0
      @done = false
    else
      @done = true
    end
  end
  
  # Mark a task as "done" in the database.
  def mark_as_done
    CONNECTION.execute("UPDATE tasks SET done = 1 WHERE id = #{self.id}")
    self.done = true
  end
end