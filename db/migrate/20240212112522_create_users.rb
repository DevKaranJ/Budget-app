class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, index: { unique: true }  # Ensure unique usernames
      t.timestamps
    end
  end
end
