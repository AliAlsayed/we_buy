class PledgesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_buyer
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

  private
   def require_buyer
    unless current_user && !current_user.is_seller
      redirect_to root_path, notice: "sorry, sellers can't pledge for offers"
    end
   end
end
