class AddRepliesCountToChirps < ActiveRecord::Migration[7.1]
  def change
    add_column :chirps, :replies_count, :integer, default: 0
  end
end
