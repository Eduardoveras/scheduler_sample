class CreateScheduleDays < ActiveRecord::Migration[5.2]
  def change
    create_table :schedule_days do |t|
      t.references :schedule_week, foreign_key: true
      t.boolean :available_24_hours
      t.time :range_begin
      t.time :range_end
      t.date :date

      t.timestamps
    end
  end
end
