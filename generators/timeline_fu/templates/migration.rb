class CreateTimelineEvents < ActiveRecord::Migration
  def self.up
    create_table :timeline_events do |t|
      t.string   :event_type, :subject_type,  :actor_type,  :secondary_subject_type
      t.integer               :subject_id,    :actor_id,    :secondary_subject_id
      t.text     :stored_subject
      t.timestamps
    end
    add_index :timeline_events, :subject_type
    add_index :timeline_events, :actor_type
    add_index :timeline_events, :secondary_subject_type
    add_index :timeline_events, :subject_id
    add_index :timeline_events, :actor_id
    add_index :timeline_events, :secondary_subject_id
  end
 
  def self.down
    drop_table :timeline_events
  end
end
 

