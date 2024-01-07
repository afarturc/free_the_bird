class AddDefaultBioToUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :bio, from: nil, to: ""
  end
end
