class CreateContactFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_files do |t|
      t.string :filename, null: false
      t.text :content, default: ""
      t.jsonb :match_columns, default: {}
      t.string :state
      t.references :user

      t.timestamps
    end
  end
end
