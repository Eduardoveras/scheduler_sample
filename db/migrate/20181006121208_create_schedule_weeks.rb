class CreateScheduleWeeks < ActiveRecord::Migration[5.2]
  def change
    create_table :schedule_weeks do |t|

      t.timestamps
    end
  end
end
