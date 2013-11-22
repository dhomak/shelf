# my_app.rb
require 'sinatra/base'
require 'pry'

class ShelfApp < Sinatra::Base  
  get '/' do
    name = params["name"] || "World"

    "Hello #{name}"
  end
  
  run! if app_file == $0
end