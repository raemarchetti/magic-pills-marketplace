class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :effect
      t.integer :lifespan_days
      t.string :side_effects
      t.references :user, null: false, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
