class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content, null: false, limit: 1200
      t.string :image, null: false, limit: 200
      t.references :topic, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
