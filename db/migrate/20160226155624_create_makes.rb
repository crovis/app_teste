class CreateMakes < ActiveRecord::Migration
  def change
    create_table :marcas do |t|
      t.string :nome
      t.integer :webmotors_id
      
      t.timestamps null: false
    end
  end
end
