class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :body, null: false, default: ""
      t.references :user, null: false, foreign_key: true
      t.references :chirp, null: false, foreign_key: true

      t.timestamps
    end
  end
end
