class CreateOfferBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :offer_buyers do |t|
      t.integer :buyer_id
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
