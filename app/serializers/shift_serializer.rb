class ShiftSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :roleId, :startTime, :endTime, :staff_required, :number_of_invited_staff, :jobType

  def roleId
    object.role_id
  end

  def startTime
    object.start_time&.strftime("%H:%M")
  end

  def endTime
    object.end_time&.strftime("%H:%M")
  end

  def jobType
    object.job_type
  end

end
