require "sinatra"
require 'pry'

get "/" do
  erb :"home"
end

get "/:msg" do
  message = params["msg"]
  case true
  when message.capitalize == message
    @response_message = "You wrote #{message}.  Is that someone's name?"
  when message.to_i > 0
    @response_message = "You wrote #{message}.  Is that how old you are?"
  else
    @response_message = "You wrote #{message}. Whatever."
  end
  erb :"message"
end