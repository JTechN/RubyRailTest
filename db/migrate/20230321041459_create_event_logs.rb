class CreateEventLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :event_logs do |t|
      t.string :action
      t.string :model_name
      t.integer :model_id
      t.text :before_image
      t.text :after_image

      t.timestamps
    end
  end
end
