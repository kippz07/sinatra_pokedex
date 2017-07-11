class PokemonController

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  
  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") } 

  configure :development do
      register Sinatra::Reloader
  end

  # index
  get "/" do
    "Homepage"
  end

  # show
  get "/:id" do
    "Show"
  end

  # new
  get "/new" do
    "New"
  end

  # create
  post "/" do
    "Created"
  end

  # edit
  get "/:id/edit" do
    "Edit"
  end

  # update
  put "/:id" do
    "Updated"
  end 

  # delete
  delete "/:id" do
    "Deleted"
  end
end