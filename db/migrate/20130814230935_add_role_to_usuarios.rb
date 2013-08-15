class AddRoleToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :role, :integer
  end
end
