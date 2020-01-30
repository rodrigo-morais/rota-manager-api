class ShiftsController < ApplicationController
  def index
    @shifts = Shift.all

    render json: @shifts, status: :ok
  end
end
