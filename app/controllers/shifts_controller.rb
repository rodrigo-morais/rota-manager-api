class ShiftsController < ApplicationController
  def index
    @shifts =
      if params[:jobType]
        Shift.where(job_type: params[:jobType])
      else
        Shift.all
      end

    render json: @shifts, status: :ok
  end
end
