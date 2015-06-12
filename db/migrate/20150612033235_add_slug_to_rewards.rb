class AddSlugToRewards < ActiveRecord::Migration
  def change
    add_column :rewards, :slug, :string
    add_index :rewards, :slug, unique: true
  end
end
