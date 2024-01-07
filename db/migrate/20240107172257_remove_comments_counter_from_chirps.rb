class RemoveCommentsCounterFromChirps < ActiveRecord::Migration[7.1]
  def change
    remove_column :chirps, :comments_counter
  end
end
