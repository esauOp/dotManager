class CreateTaskHistories < ActiveRecord::Migration
  def change
    create_table :task_histories do |t|
      t.integer :task_id
      t.integer :version
      t.decimal :time

      t.timestamps
    end
  end
end
