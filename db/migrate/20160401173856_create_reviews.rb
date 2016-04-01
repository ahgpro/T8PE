class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :post, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :content
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
