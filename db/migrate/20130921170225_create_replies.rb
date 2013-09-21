class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :content
      t.integer :task_comment_id
      t.integer :usuario_id

      t.timestamps
    end
  end
end
