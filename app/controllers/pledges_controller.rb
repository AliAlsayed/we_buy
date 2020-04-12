class PledgesController < ApplicationController
	before_action :authenticate_user!
  def create
  	@deal = Offer.find(params[:offer_id])
  	@deal.pledges.create!(buyer: current_user)
  	redirect_to deal_path(@deal)
  end
  def destroy
  	@deal = Offer.find(params[:offer_id])
  	pledge = current_user.pledges.find(params[:id])
  	pledge.destroy 
  	redirect_to deal_path(@deal) 
  end
end
