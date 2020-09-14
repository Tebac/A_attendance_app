class LocationsController < ApplicationController
  before_action :set_user
  before_action :set_location, only: %i(show edit update destroy)
  before_action :logged_in_user
  # before_action :correct_user
  
  def index
    @locations = @user.locations
  end
  
  def show
  end
  
  def new
    @location = Location.new
  end
  
  def create
    @location = @user.locations.build(location_params)
    if @location.save
      flash[:success] = '新しい拠点を作成しました。'
      redirect_to user_locations_url @user
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @location.update_attributes(location_params)
      flash[:success] = "拠点を更新しました。"
      redirect_to user_location_url(@user, @location)
    else
      render :edit
    end
  end
  
  def destroy
    @location.destroy
    flash[:success] = "拠点を削除しました。"
    redirect_to user_locations_url @user
  end
  
  

private

  def location_params
    params.require(:location).permit(:id, :location_name, :location_type)
  end
  
  def set_user
    @user = User.find(params[:user_id])
  end
 
  def set_location
    unless @location = @user.locations.find_by(id: params[:id])
      flash[:danger] = "権限がありません。"
      redirect_to user_locations_url @user
    end
  end
end
