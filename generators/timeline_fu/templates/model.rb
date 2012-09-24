class TimelineEvent < ActiveRecord::Base

  belongs_to :actor,              :polymorphic => true
  belongs_to :subject,            :polymorphic => true
  belongs_to :secondary_subject,  :polymorphic => true
  
  validates_presence_of :subject_type, :subject_id
  
  def subject_obj
    if stored_subject
      stored_subj = ActiveSupport::JSON.decode(stored_subject)["#{subject_type.downcase}"]
      stored_subj.delete("id")
      subj = subject_type.constantize.new
      subj.attributes = stored_subj
      subj
    else
      subject
    end
  end
  
  def subject_json
    ActiveSupport::JSON.decode(stored_subject)["#{subject_type.downcase}"] if stored_subject
  end
  
end
