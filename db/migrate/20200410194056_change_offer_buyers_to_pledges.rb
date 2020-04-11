class ChangeOfferBuyersToPledges < ActiveRecord::Migration[6.0]
  def change
  	rename_table :offer_buyers, :pledges
  end
end
