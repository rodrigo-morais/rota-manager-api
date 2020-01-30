class CreateShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shifts, id: :uuid do |t|
      t.integer :role_id
      t.datetime :start_time
      t.datetime :end_time
      t.integer :staff_required
      t.integer :number_of_invited_staff
      t.string :job_type
      t.timestamps
    end
  end
end
