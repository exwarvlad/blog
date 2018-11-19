class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.string :content
      t.string :file
      t.references :category, forgin_key: true

      t.timestamps
    end
  end
end
