class InvitedContractsController < ApplicationController
  def index
    @invited_contracts = InvitedContract.filter(params[:roleId])

    render json: @invited_contracts, status: :ok
  end
end
