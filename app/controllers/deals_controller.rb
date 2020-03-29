class DealsController < ApplicationController
  def index
  	@deals = Offer.all
  end
end
