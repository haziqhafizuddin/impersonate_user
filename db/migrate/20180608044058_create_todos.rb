class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.references :user

      t.timestamps
    end
  end
end
