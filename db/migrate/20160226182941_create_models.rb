class CreateModels < ActiveRecord::Migration
  def change
    create_table :modelos do |t|
      t.integer :marca_id
      t.string :nome

      t.timestamps null: false
    end
  end
end
