class AddEndsAtToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :ends_at, :datetime
  end
end
