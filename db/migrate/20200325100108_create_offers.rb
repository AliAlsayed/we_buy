class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.integer :buyers_required
      t.integer :amount_per_buyer
      t.float :discount
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
