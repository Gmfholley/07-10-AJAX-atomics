get "/" do
  @tasks = Task.all
  
  erb :"main/homepage"
end

get "tasks/create_new" do 
  
end


get "/tasks/:method/:task_id" do
  task_id = params["task_id"].to_i
  @task = Task.find(task_id)
  @next_response = @task.done_in_english
  # run the method on the task
  @task.method(params["method"]).call
  # return what the next anchor command would be, not this one
  return @next_response
end