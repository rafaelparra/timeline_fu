class CreateTimelineEvents < ActiveRecord::Migration
  def self.up
    create_table :timeline_events do |t|
      t.string   :event_type, :limit => 30
      t.string   :subject_type, :limit => 30
      t.string   :actor_type, :limit => 30
      t.string   :secondary_subject_type, :limit => 30
      t.string   :context_type, :limit => 30
      t.integer  :subject_id,    :actor_id,    :secondary_subject_id
      t.text     :stored_subject
      t.timestamps
    end
    add_index :timeline_events, [:actor_id, :secondary_subject_id], :name => 'chalkboard_index'
    add_index :timeline_events, :actor_type
    add_index :timeline_events, :secondary_subject_type
    add_index :timeline_events, [:subject_id, :subject_type], :name => 'subject_index'
    add_index :timeline_events, [:context_id, :context_type], :name => 'context_index'
    add_index :timeline_events, :created_at
  end
 
  def self.down
    drop_table :timeline_events
  end
end
 

