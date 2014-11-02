class CreateFunds < ActiveRecord::Migration
  def change
    create_table :funds do |t|
      t.integer :points
      t.references :dare

      t.timestamps
    end
  end
end
