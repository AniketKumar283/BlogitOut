class RemovePasswordColumns < ActiveRecord::Migration[8.0]
  def change
    remove_columns :users, :password
    remove_columns :users, :password_digest
  end
end
