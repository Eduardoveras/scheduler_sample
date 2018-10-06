class ScheduleDay < ApplicationRecord
  belongs_to :schedule_week, optional: true
  before_validation :clean_time
  validate :time_in_order


  private
  def clean_time
    if range_begin.present?
      self.range_begin = Time.parse(range_begin.to_s)
    else
      self.range_begin = nil
      self.range_end = nil
    end

    if range_end.present?
      self.range_end = Time.parse(range_end.to_s)
    else
      self.range_begin = nil
      self.range_end = nil
    end
  end

  def time_in_order
    if range_begin.present? and range_end.present? and range_begin > range_end
      errors.add(:range_end, "The end time should be higher than the beginning time")
    end
  end


end
