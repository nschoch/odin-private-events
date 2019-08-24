class CreateUsersAndEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.integer :event_id
      t.integer :attendee_id
      t.boolean :accepted
      t.timestamps
    end

    add_foreign_key :invitations, :users, column: :attendee_id
    add_foreign_key :invitations, :events, column: :event_id
    add_index :invitations, :attendee_id
    add_index :invitations, :event_id
  end
end
