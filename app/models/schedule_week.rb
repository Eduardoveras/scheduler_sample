class ScheduleWeek < ApplicationRecord
  has_many :schedule_days
  accepts_nested_attributes_for :schedule_days
end
