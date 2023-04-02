class CreatePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :promotions do |t|
      t.string :name, limit: 60, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.references :teacher, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
