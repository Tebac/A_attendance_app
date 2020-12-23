class UsersController < ApplicationController
  
  before_action :set_user, only: %i(show edit update destroy confirmation_show)
  before_action :logged_in_user, only: %i(index show edit update edit_basic_info import confirmation_show)
  before_action :admin_user, only: %i(index employees_working locations edit_all_basic_info edit update destroy)
  before_action :correct_user, only: %i(show)
  # before_action :admin_or_correct, only: %i(show)
  before_action :superior_user, only: %i(confirmation_show) 
  before_action :superior_himself, only: %i(confirmation_show) 
  before_action :admin_exclusion, only: %i(show confirmation_show)
  # before_action :superior_or_correct, only: %i(show)
  before_action :set_one_month, only: %i(show confirmation_show)
  before_action :one_month_request, only: %i(confirmation_show)
  before_action :notice_overtime_request, only: %i(confirmation_show)
  before_action :change_attendance_request, only: %i(confirmation_show)
    

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
      @superiors = superior_without_me
      @superiors_all = superior_add_me
      @month = set_one_month_request
    
    respond_to do |format|
      format.html
      format.csv do
          send_data render_to_string.encode(Encoding::Windows_31J, undef: :replace, row_sep: "\r\n", force_quotes: true),
          filename: "#{@user.name}(#{l(@first_day, format: :middle)})勤怠情報.csv", type: :csv
      end
    end
    end
    
    def confirmation_show
      @worked_sum = @attendances.where.not(started_at: nil).count
      @superiors = superior_without_me
      @superiors_all = superior_add_me
      @month = set_one_month_request
      
      unless @attendances.where(superior_id: current_user.id).present? || @attendances.where(change_superior_id: current_user.id).present? || @attendances.where(overtime_superior_id: current_user.id).present?
      
        flash[:danger] = "アクセス不可。"
         redirect_to root_url and return
      end
    end
    
    def new
      @user = User.new
    end
    
    def create
      @user = User.new(user_params)
      if @user.save
      log_in @user
      flash[:success] = 'アカウントを新規作成しました。'
      redirect_to @user
      else
      render :new
      end
    end
    
    def edit
    end
    
    def update
      @user.update_attributes(user_params)
      flash[:success] = "#{@user.name}のデータを更新。"
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
      params.require(:user).permit(:name, :email, :affiliation, :employee_number, :uid, :superior, :admin, :password, :password_confirmation,
                                    :basic_work_time, :designated_work_start_time, :designated_work_end_time)
    end
  
    
     def user_info_params
      params.require(:user).permit(:affiliation, :employee_number, :uid, :basic_work_time, :designated_work_start_time, :designated_work_end_time)
     end
 
end
