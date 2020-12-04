class LocationsController < ApplicationController
  
  before_action :logged_in_user, only: %i(index create edit update destroy)
  before_action :admin_user, only: %i(index create edit update destroy)
  before_action :set_location, only: %i(edit update destroy)

  
  def index
    @locations = Location.all
  end
  
  def create
    location = Location.new
    location.location_number = "未設定"
    location.location_name = "未設定"
    location.location_type = "未設定"
    if location.save
      flash[:success] = '新しい拠点を追加しました。拠点番号、拠点名、勤怠種類を設定してください。'
      redirect_to user_locations_url 
    else
      flash[:danger] = "入力に不備があり、追加できませんでした。"
      redirect_to user_locations_url
    end
  end
  
  def edit
  end
  
  def update
    if @location.update_attributes(location_params)
      flash[:success] = "拠点を更新しました。"
      redirect_to user_locations_url
    else
      render '_edit'
    end
  end
  
  
  def destroy
    location = Location.find(params[:id])
    if location.destroy
      flash[:success] = "拠点を削除しました。"
      redirect_to user_locations_url
    end
  end
  
  
private

  def location_params
    params.require(:location).permit(:location_number, :location_name, :location_type)
  end
  
  # def set_user
  #   @user = User.find(params[:user_id])
  # end
 
  def set_location
    @location = Location.find(params[:id])
  end
end
