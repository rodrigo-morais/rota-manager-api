class InvitedContract < ApplicationRecord
  belongs_to :shift, foreign_key: :role_id, primary_key: :role_id

  scope :role_id, -> role_id { where role_id: role_id }

  def self.filter(role_id)
    invited_contracts = all

    if role_id.present?
      invited_contracts = invited_contracts.role_id(role_id)
    end

    invited_contracts
  end
end
