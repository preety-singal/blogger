class ChangeColumnFromUsers < ActiveRecord::Migration
  def change
  	change_column :users, :roles, :boolean, :default => false
  end
end
