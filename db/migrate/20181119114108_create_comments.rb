class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :author, null: false
      t.string :content, null: false
      t.references :commentable, polimorphyc: true, index: true

      t.timestamps
    end
  end
end
