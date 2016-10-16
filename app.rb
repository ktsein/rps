require 'sinatra/base'
require './lib/computer'
require './lib/player'
require './lib/game'

class RPS < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/name' do
    $computer = Computer.new
    $player = Player.new(params[:player])
    $game = Game.new
    redirect '/play'
  end

  get '/play' do
    @player = $player
    erb(:play)
  end

  post '/rock' do
    $player.select("Rock")
    $computer.random_select
    redirect '/result'
  end

  post '/paper' do
    $player.select("Paper")
    $computer.random_select
    redirect '/result'
  end

  post '/scissor' do
    $player.select("Scissor")
    $computer.random_select
    redirect '/result'
  end

  get '/result' do
    @computer = $computer
    @player = $player
    @game = $game
    @game.who_win(@player.player_item, @computer.computer_item)
    erb(:result)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
