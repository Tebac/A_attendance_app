class UsersController < ApplicationController
  
  before_action :set_user, only: %i(show edit update destroy)
  before_action :logged_in_user, only: %i(index show edit update)
  before_action :admin_user, only: %i(index edit update destroy)
  # before_action :correct_user, only: %i(edit update)
  before_action :admin_or_correct, only: %i(show)
  # before_action :superior_user
  # before_action :superior_or_correct
  before_action :set_one_month, only: :show
    

    def index
      @users = User.where('name LIKE ?', "%#{params[:name]}%").paginate(page: params[:page], per_page: 10)
    end
    
    def import
        # fileはtmpに自動で一時保存される
        User.import(params[:file])
        flash[:success] = "従業員を追加しました。"
        redirect_to users_url
    end
    
    def employees_working
      @users = User.where('name LIKE ?', "%#{params[:name]}%").paginate(page: params[:page], per_page: 10)
      
      @user_attendance_info = []
      User.all.each do |item|
        if item.attendances.any?{|info|(info.started_at.present? && info.finished_at.blank?)}
          @user_attendance_info.push(item)
        end
      end
    end
    
    def show
      @worked_sum = @attendances.where.not(started_at: nil).count
    end
    
    def new
      @user = User.new
    end
    
    def create
      @user = User.new(user_params)
      if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
      else
      render :new
      end
    end
    
    def edit
    end
    
    def update
      @user.update_attributes(user_params)
      flash[:success] = "#{@user.name}のデータを更新しました。"
      redirect_to users_url
      
    end
    
    def destroy
      @user.destroy
      flash[:success] = "#{@user.name}のデータを削除しました。"
      redirect_to users_url
    end
    
    def edit_all_basic_info
    end
    
    
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  
   
    
    # paramsハッシュからユーザーを取得します。
    def set_user
      @user = User.find(params[:id])
    end
    
     def user_info_params
      params.require(:user).permit(:affiliation, :employee_number, :uid, :basic_time, :designated_work_srart_time, :designated_work_end_time)
     end
     
      # システム管理権限所有かどうか判定します。
    # def superior_user
    #   redirect_to root_url unless current_user.superior?
    # end
     
    # def superior_or_correct
    #   unless current_user?(@user) || current_user.superior?
    #   flash[:danger] = "権限がありません。"
    #   redirect_to root_url
    #   end
    # end
 
end
