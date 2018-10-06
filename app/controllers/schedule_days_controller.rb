class ScheduleDaysController < ApplicationController
  before_action :set_schedule_day, only: [:show, :update, :destroy]

  # GET /schedule_days
  def index
    @schedule_days = ScheduleDay.all

    render json: @schedule_days
  end

  # GET /schedule_days/1
  def show
    render json: @schedule_day
  end

  # POST /schedule_days
  def create
    @schedule_day = ScheduleDay.new(schedule_day_params)

    if @schedule_day.save
      render json: @schedule_day, status: :created, location: @schedule_day
    else
      render json: @schedule_day.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /schedule_days/1
  def update
    if @schedule_day.update(schedule_day_params)
      render json: @schedule_day
    else
      render json: @schedule_day.errors, status: :unprocessable_entity
    end
  end

  # DELETE /schedule_days/1
  def destroy
    @schedule_day.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule_day
      @schedule_day = ScheduleDay.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def schedule_day_params
      params.require(:schedule_day).permit(:schedule_week_id, :available_24_hours, :range_begin, :range_end, :date)
    end
end
