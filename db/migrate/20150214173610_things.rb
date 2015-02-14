class Things < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :item
      t.string :priority
      t.text :description
      t.integer :estimated_cost
    end
  end
end
