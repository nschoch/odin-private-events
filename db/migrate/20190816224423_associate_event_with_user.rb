class AssociateEventWithUser < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :creator_id, :integer
    add_foreign_key :events, :users, column: :creator_id
    add_index :events, :creator_id
  end
end
