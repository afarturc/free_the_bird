class AddLikesCounterToChirps < ActiveRecord::Migration[7.1]
  def change
    add_column :chirps, :likes_counter, :integer, default: 0
    add_column :chirps, :comments_counter, :integer, default: 0
  end
end
