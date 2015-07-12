get "/" do
  @tasks = Task.all
  
  erb :"main/homepage"
end

get "/tasks/mark_as_done/:task_id" do
  task_id = params["task_id"].to_i
  
  @task = Task.find(task_id)
  @task.mark_as_done
  
  return "Done!"
end