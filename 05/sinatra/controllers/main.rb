get "/" do
  @tasks = Task.all
  
  erb :"main/homepage"
end

get "/tasks/create_new" do 
  @task = Task.new(params["task"])
  @task.save_record
  return "#{@task.id}-#{@task.content}"

end


get "/tasks/:method/:task_id" do
  task_id = params["task_id"].to_i
  @task = Task.create_from_database(task_id)
  @next_response = @task.done_in_english
  # run the method on the task
  @task.method(params["method"]).call
  # return what the next anchor command would be, not this one
  return @next_response
end