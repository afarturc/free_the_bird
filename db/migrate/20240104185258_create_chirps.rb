class CreateChirps < ActiveRecord::Migration[7.1]
  def change
    create_table :chirps do |t|
      t.text :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
