class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    erb :'/pets/new'
  end

  post '/pets' do 
    @pet = Pet.create(params[:pet])
    @pet.owner = Owner.create(name: params[:owner_name]) unless params[:owner_name].empty?
    @pet.save
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
    erb :'/pets/edit'
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  post '/pets/:id' do 
    @pet = Pet.find(params[:id])
    @pet.update(params[:pet])
    @pet.owner = Owner.create(params[:owner]) unless params[:owner].empty?
    @pet.save
    redirect to "pets/#{@pet.id}"
  end
end