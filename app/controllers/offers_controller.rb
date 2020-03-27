class OffersController < ApplicationController

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

  private
    def offer_params
      params.require(:offer).permit(:buyers_required, :amount_per_buyer, :discount, :expiration)
    end
end
