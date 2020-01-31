class ShiftsController < ApplicationController
  def index
    @shifts = Shift.filter(params[:jobType], params[:period])

    render json: @shifts, status: :ok
  end
end
