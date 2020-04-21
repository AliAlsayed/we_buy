class OffersController < ApplicationController

  before_action :require_seller, only: [:current_seller_offers]
  
  def current_seller_offers
    @offers = current_user.offers
  end

  def index
    @product = Product.find(params[:product_id])
    @offers = @product.offers
  end

  def new
    @product = Product.find(params[:product_id])
    @offer = @product.offers.new
  end

  def create
    @product = Product.find(params[:product_id])
    @offer = @product.offers.new(offer_params)
    if @offer.save
      redirect_to product_offers_path(@product)
    else
      render :new
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to root_path
  end

  private
    def offer_params
      params.require(:offer).permit(:buyers_required, :amount_per_buyer, :discount, :expiration)
    end

    def require_seller
      unless current_user && current_user.is_seller 
        redirect_to root_path
      end
    end
end
