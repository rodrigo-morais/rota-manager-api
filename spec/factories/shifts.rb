FactoryBot.define do
  factory :shift do
    role_id { 1 }
    start_time { DateTime.new(2001,2,3,4,5,6) }
    end_time { DateTime.new(2001,2,3,6,0,0) }
    staff_required { 5 }
    number_of_invited_staff { 3 }
    job_type { "Waiting staff" }

    trait :barista do
      job_type { "Barista" }
    end
  end
end
