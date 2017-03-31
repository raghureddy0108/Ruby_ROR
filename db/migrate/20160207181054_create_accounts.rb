class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :firstname
      t.string :lastname
      t.integer :account_number
      t.decimal :account_balance
      t.string :address
      t.date :dob 

      t.timestamps null: false
    end
  end
end
