class CreateContactLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_logs do |t|
      t.jsonb :contact_details
      t.jsonb :errors_details
      t.references :user

      t.timestamps
    end
  end
end
