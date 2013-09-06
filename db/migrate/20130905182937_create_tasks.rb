class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :date_ini
      t.datetime :date_end
      t.boolean :milestone
      t.decimal :estimated_time
      t.text :description
      t.decimal :actual_time
      t.boolean :running
      t.integer :version

      t.integer :project_id
      t.integer :task_status_id      
      t.integer :task_cat_id
      t.integer :task_priority_id
      t.integer :assignee_id
      
      t.timestamps
    end
  end
end
