require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

require_relative './models/pokemon.rb'
require_relative './controllers/pokemon_controller.rb'

use Rack::MethodOverride
run PokemonController