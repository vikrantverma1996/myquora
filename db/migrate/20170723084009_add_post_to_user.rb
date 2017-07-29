class AddPostToUser < ActiveRecord::Migration
  def change
    add_column :users, :post, :integer,:default => 1
  end
end
