class CreateUserPromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_promotions do |t|
      t.integer :promotion_id, null: false
      t.string :user_id, null: false

      t.timestamps

    end
    add_index :user_promotions, [:promotion_id, :user_id], unique: true
  end
end


