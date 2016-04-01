class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :title
      t.text :content
      t.string :hashtag
      t.string :image
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
