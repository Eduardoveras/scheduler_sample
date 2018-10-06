class ScheduleWeeksController < ApplicationController
  before_action :set_schedule_week, only: [:show, :update, :destroy]

  # GET /schedule_weeks
  def index
    @schedule_weeks = ScheduleWeek.all

    render json: @schedule_weeks
  end

  # GET /schedule_weeks/1
  def show
    render json: @schedule_week
  end

  # POST /schedule_weeks
  def create
    @schedule_week = ScheduleWeek.new(schedule_week_params)

    if @schedule_week.save
      render json: @schedule_week.to_json(:include => :schedule_days), status: :created, location: @schedule_week
    else
      render json: @schedule_week.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /schedule_weeks/1
  def update
    if @schedule_week.update(schedule_week_params)
      render json: @schedule_week
    else
      render json: @schedule_week.errors, status: :unprocessable_entity
    end
  end

  # DELETE /schedule_weeks/1
  def destroy
    @schedule_week.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule_week
      @schedule_week = ScheduleWeek.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def schedule_week_params
      params.require(:schedule_week).permit!
    end
end
