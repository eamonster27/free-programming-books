class AddFieldnameToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :user_id, :integer
    add_column :books, :id, :integer, unique: true
  end
end
