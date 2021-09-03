class ChangeBodyTypeInMessages < ActiveRecord::Migration[6.1]
  def up
    change_column :messages, :body, :text
  end

  def down
    change_column :messages, :body, :string
  end
end
