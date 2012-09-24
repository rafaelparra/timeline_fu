class TimelineEvent < ActiveRecord::Base
  belongs_to :actor,              :polymorphic => true
  belongs_to :subject,            :polymorphic => true
  belongs_to :secondary_subject,  :polymorphic => true
  
  validates_presence_of :subject_type, :subject_id
  
  def json_subject
    ActiveSupport::JSON.decode(stored_subject)["#{subject_type.underscore}"] if stored_subject
  end
  
end
