class CreateSemesters < ActiveRecord::Migration[7.0]
  def change
    create_table :semesters do |t|
      t.string :name, limit: 60, null: false

      t.timestamps
    end
  end
end
