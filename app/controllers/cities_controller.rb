class CitiesController < ApplicationController
  def index
  end

  def show
    @city = City.find(params[:id])
    @user = User.where(:city_id => @city.id)
    @gossips_array = Gossip.joins(:user).where(:user => @user)
    puts "***************************"
    puts @gossips_array
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def create
  end

  def new
  end
end
