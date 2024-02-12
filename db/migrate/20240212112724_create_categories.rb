class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :icon, null: false
      t.references :user, null: false, foreign_key: true  # Author relationship using user

      t.timestamps
    end

    add_index :categories, [:user_id, :name], unique: true  # Ensure unique names per user
  end
end
