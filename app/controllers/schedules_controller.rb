class SchedulesController < ApplicationController
  
  def edit
    @schedule = Schedule.find(params[:id])
  end
  
  def update
    @schedule = Schedule.find(params[:id])
    @schedule.update!(schedule_params)
    redirect_to root_url 
  end

  private

  def schedule_params
    params.require(:schedule).permit(:schedule_finished_at)
  end

end
