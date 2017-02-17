class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title, null: false, limit: 100
      t.text :content, null: false, limit: 1200
      t.string :image, null: false, limit: 200
      t.references :board, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
