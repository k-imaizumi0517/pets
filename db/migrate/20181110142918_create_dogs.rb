class CreateDogs < ActiveRecord::Migration[5.1]
  def change
    create_table :dogs do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :image, null: false
      t.references :age, foreign_key: true
      t.references :type, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
