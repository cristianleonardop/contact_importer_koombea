class RenameCreditCardColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :contacts, :credit_card, :encrypted_credit_card
    add_column :contacts, :encrypted_credit_card_iv, :string
  end
end
