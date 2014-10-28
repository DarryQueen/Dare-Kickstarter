class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.integer :points
      t.references :user

      t.timestamps
    end
  end
end
