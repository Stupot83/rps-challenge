require 'sinatra/base'

class RPSSL < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views") }
  
  enable :sessions
  set :session_secret, 'session_secret'

  get '/' do
    erb(:index)
  end

  run! if app_file == $0
end
