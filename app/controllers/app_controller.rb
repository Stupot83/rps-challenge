require 'sinatra/base'
require_relative '../models/player'
require_relative '../models/game'
require_relative '../models/turn'
require_relative '../models/result_calculator'
require_relative '../models/bot'

class RPSSL < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')
  
  enable :sessions
  set :session_secret, 'session_secret'

  get '/' do
    erb(:index)
  end

  post '/names' do
    player_1 = Player.new(name: params[:p1_name])
    player_2 = Player.new(name: params[:p2_name], human: (params[:player_2_type] == 'human'))
    Game.new(player_1: player_1, player_2: player_2)
    Turn.turn_session
    redirect '/play'
  end

  get '/play' do
    @game = Game.game_session
    @turn = Turn.turn_session
    erb(:game)
  end

  post '/p1_turn' do
    Turn.new(player_1_turn: params[:p1_choice].to_sym)

    if Game.game_session.players[:player_2].human == true
      redirect '/play'
    else
      player_2_turn = Bot.pick_turn
      Turn.turn_session.end_turn(player_2_turn: player_2_turn)
      redirect '/outcome'
    end
  end

  post '/p2_turn' do
    Turn.turn_session.end_turn(player_2_turn: params[:p2_choice].to_sym)
    redirect '/outcome'
  end

  get '/outcome' do
    @turn = Turn.turn_session
    @game = Game.game_session
    erb :outcome
  end

  run! if app_file == $0
end
