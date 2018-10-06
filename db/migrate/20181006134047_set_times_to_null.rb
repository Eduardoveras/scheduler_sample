class SetTimesToNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :schedule_days, :range_begin, true
    change_column_null :schedule_days, :range_end, true
  end
end
