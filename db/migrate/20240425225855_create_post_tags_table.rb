class CreatePostTagsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :post_tags do |t|
      t.references :post, null: false
      t.references :tag, null: false

      t.timestamps
    end
  end
end
