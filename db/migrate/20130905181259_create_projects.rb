class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.datetime :date_ini
      t.datetime :date_end
      t.text :description
      t.decimal :cost_hr

      t.integer :cliente_id
      t.integer :leader_id

      t.timestamps
    end
  end
end
