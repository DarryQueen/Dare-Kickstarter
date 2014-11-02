class CreateDares < ActiveRecord::Migration
  def change
    create_table :dares do |t|
      t.string :title
      t.text :description
      t.integer :goal

      t.timestamps
    end
  end
end
