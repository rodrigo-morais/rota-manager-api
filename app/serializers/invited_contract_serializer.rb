class InvitedContractSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :roleId, :candidateName

  def roleId
    object.role_id
  end

  def candidateName
    object.candidate_name
  end
end
