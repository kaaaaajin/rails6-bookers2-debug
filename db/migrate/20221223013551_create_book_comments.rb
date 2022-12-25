class CreateBookComments < ActiveRecord::Migration[6.1]
  def change
    create_table :book_comments do |t|

      t.timestamps
      t.text :comment
      t.string :user_id
      t.string :book_id
    end
  end
end
