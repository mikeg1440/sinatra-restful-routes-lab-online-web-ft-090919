class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  
  get '/recipes' do 
    @recipes = Recipe.all
    erb :index
  end 
  
  get '/recipes/new' do 
    erb :new
  end 
  
  post '/recipes' do 
    recipe = Recipe.new(params)
    recipe.save 
    redirect "/recipes/#{recipe.id.to_s}"
  end 
  
  get '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end 
  
  get '/recipes/:id/edit' do 
    @recipe = Recipe.find_by_id(params[:id])
    
    erb :edit
  end 
  
  patch '/recipes/:id' do 
    params.delete("_method")
    recipe = Recipe.find_by_id(params[:id])
    recipe.update(params)
    redirect "/recipes/#{recipe.id.to_s}"
  end 
  
  delete '/recipes/:id' do 
    recipe = Recipe.find_by_id(params[:id])
    recipe.delete
    redirect '/recipes'
  end  

end
