class CreateLectures < ActiveRecord::Migration[7.0]
  def change
    create_table :lectures do |t|
      t.string :name, limit: 60, null: false
      t.string :description, limit: 255
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
