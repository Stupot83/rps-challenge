require 'sinatra/base'
require_relative '../models/player'
require_relative '../models/game'

class RPSSL < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views") }
  
  enable :sessions
  set :session_secret, 'session_secret'

  get '/' do
    erb(:index)
  end

  post '/names' do
    player_1 = Player.new(name: params[:p1_name])
    player_2 = Player.new(name: params[:p2_name], human: (params[:player_2_type] == 'human'))
    Game.new(player_1: player_1, player_2: player_2)
    redirect '/play'
  end

  get '/play' do
    @game = Game.game_instance
    erb(:game)
  end

  run! if app_file == $0
end
