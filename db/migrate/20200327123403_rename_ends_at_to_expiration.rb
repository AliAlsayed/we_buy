class RenameEndsAtToExpiration < ActiveRecord::Migration[6.0]
  def change
  	rename_column :offers, :ends_at, :expiration
  end
end
