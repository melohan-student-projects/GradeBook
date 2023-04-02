class CreateLectures < ActiveRecord::Migration[7.0]
  def change
    create_table :lectures do |t|
      t.string :name, limit: 5, null: false
      t.string :description
      t.integer :category_id

      t.timestamps
    end
  end
end
