class CreateInvitedContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :invited_contracts do |t|
      t.integer :role_id
      t.string :candidate_name
      t.timestamps
    end
  end
end
