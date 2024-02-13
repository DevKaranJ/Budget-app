# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.string :name, null: false
      t.decimal :amount, null: false
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true # Explicitly connect transactions to users

      t.timestamps
    end
  end
end
