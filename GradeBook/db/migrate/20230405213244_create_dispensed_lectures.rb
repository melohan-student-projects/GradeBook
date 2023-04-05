class CreateDispensedLectures < ActiveRecord::Migration[7.0]
  def change
    create_table :dispensed_lectures do |t|
      t.references :lecture, null: false, foreign_key: true
      t.references :promotion, null: false, foreign_key: true
      t.references :semester, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
