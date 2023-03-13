class CreateuserTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :user_types do |t|
      t.string :name, limit: 60, null: false
      t.string :slug, limit: 10, null: false
      t.string :description, limit: 255, null: false
      t.timestamps null: false
    end
  end
end
