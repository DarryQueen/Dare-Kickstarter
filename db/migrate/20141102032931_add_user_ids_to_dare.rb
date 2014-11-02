class AddUserIdsToDare < ActiveRecord::Migration
  def change
    change_table :dares do |t|
      t.references :creator
      t.references :subject
    end
  end
end
