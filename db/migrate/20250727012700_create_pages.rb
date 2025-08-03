class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.string :slug, null: false
      t.string :title, null: false
      t.text   :body, null: false

      t.timestamps
    end
    add_index :pages, :slug, unique: true
  end
end
