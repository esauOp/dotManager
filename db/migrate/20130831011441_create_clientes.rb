class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :name
      t.string :adress
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
