class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :body
      
      t.integer :recipient_user_id
      t.integer :sender_user_id

      t.timestamps
    end
  end
end
