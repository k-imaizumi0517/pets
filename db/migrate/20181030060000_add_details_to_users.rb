class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :introduction, :text
    add_column :users, :prefecture_id, :integer
    add_column :users, :image, :string
  end
end
