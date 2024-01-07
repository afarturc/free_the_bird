class AddParentChirpIdToChirps < ActiveRecord::Migration[7.1]
  def change
    add_column :chirps, :parent_chirp_id, :integer
    add_foreign_key :chirps, :chirps, column: :parent_chirp_id
  end
end
