class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
      t.string :name, limit: 120, null: false
      t.decimal :result, precision: 2, scale: 1, null: false
      t.decimal :weight, precision: 3, scale: 1, null: false
      t.date :date, null: false
      t.references :student, null: false, foreign_key: { to_table: :users }
      t.references :teacher, null: false, foreign_key: { to_table: :users }
      t.references :dispensed_lecture, null: false, foreign_key: true

      t.timestamps
    end
  end
end
