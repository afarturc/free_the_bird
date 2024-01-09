class CreateRechirps < ActiveRecord::Migration[7.1]
  def change
    create_table :rechirps do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chirp, null: false, foreign_key: true

      t.timestamps
    end
  end
end
