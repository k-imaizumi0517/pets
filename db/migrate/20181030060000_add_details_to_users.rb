class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :prefecture, foreign_key: true
    add_column :users, :introduction, :text
    add_column :users, :image, :string
  end
end
