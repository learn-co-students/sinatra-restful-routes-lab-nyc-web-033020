require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do
    redirect to '/recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipe' do
    binding.pry
    recipe = Recipe.create(params)
    redirect to "/recipes/#{recipe.id}"
  end
  
  get '/recipes/:id/edit'do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

patch '/recipes/:id' do
  updated_recipe = Recipe.find(params[:id])
  updated_recipe.update(params[:recipe])
  
  redirect to "/recipes/#{updated_recipe.id}"
end

get '/recipes/:id' do
  @recipe = Recipe.find(params[:id])
  erb :show
end

delete '/recipes/:id' do
  @recipe = Recipe.find(params[:id]) #define recipe to delete
  
  @recipe.destroy #delete recipe
  redirect to '/recipes' #redirect back to recipe index page
  end

end
