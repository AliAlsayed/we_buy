class DealsController < ApplicationController
 
  def index
    @deals = Offer.ongoing
  end
  def show
    @deal = Offer.find(params[:id])
    @pledges = @deal.pledges.count
    if current_user
      @pledge = current_user.pledges.find_by(offer_id: @deal.id)
    end
  end
end
