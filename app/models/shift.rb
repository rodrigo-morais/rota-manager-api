class Shift < ApplicationRecord
  has_many :invited_contracts, primary_key: :role_id, foreign_key: :role_id

  scope :job_type, -> job_type { where job_type: job_type  }
  scope :start_time, -> period { where("TO_CHAR(start_time::Time, 'AM') = ?", period&.upcase)  }

  def self.filter(job_type, period)
    shifts = all

    if job_type.present?
      shifts = shifts.job_type(job_type)
    end

    if period.present?
      shifts = shifts.start_time(period)
    end

    shifts
  end
end
