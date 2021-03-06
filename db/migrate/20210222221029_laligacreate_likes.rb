class LaligaCreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :laliga_post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end