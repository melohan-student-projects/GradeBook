class CreateUserPromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_promotions do |t|
      t.integer :promotion_id, null: false
      t.integer :student_id, null: false

      t.timestamps
    end
  end
end
