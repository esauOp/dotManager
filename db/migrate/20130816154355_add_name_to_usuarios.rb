class AddNameToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :name, :string, :default => ""
    add_column :usuarios, :last_name, :string, :default => ""
  end
end
