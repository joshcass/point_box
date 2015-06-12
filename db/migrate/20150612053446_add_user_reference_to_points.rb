class AddUserReferenceToPoints < ActiveRecord::Migration
  def change
    add_reference :points, :user, index: true, foreign_key: true
  end
end
