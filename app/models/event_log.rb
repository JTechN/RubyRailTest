class EventLog < ApplicationRecord
  after_create :log_create_event
  after_update :log_update_event
  after_destroy :log_destroy_event

  private

  def log_create_event
    EventLog.create(action: "added", model_name: self.class.name, model_id: id, after_image: to_json)
  end

  def log_update_event
    EventLog.create(action: "modified", model_name: self.class.name, model_id: id, before_image: changes.to_json, after_image: to_json)
  end

  def log_destroy_event
    EventLog.create(action: "deactivated", model_name: self.class.name, model_id: id, before_image: to_json)
  end
end
