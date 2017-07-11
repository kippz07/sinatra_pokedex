class PokemonController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  
  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") } 

  configure :development do
      register Sinatra::Reloader
  end

  # index
  get "/" do
    @pokemon = Pokemon.all
    erb :"pokemon/index"
  end

  # new
  get "/new" do
    erb :"pokemon/new"
  end

  # show
  get "/:id" do
    id = params[:id].to_i
    @pokemon = Pokemon.find id
    erb :"pokemon/show"
  end

  # create
  post "/" do
    pokemon = Pokemon.new
    pokemon.index = params[:index]
    pokemon.name = params[:name]
    pokemon.location = params[:location]
    pokemon.day = params[:day]
    pokemon.shiny = params[:shiny]
    pokemon.save

    redirect "/"
  end

  # edit
  get "/:id/edit" do
    id = params[:id].to_i
    @pokemon = Pokemon.find id
    erb :"pokemon/edit"
  end

  # update
  put "/:id" do
  id = params[:id].to_i
  pokemon = Pokemon.find id
  pokemon.index = params[:index]
  pokemon.name = params[:name]
  pokemon.location = params[:location]
  pokemon.day = params[:day]
  pokemon.shiny = params[:shiny]
  pokemon.update

  redirect "/"
  end 

  # delete
  delete "/:id" do
    Pokemon.destroy params[:id]
    redirect "/"
  end
end