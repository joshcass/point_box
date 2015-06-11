class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
