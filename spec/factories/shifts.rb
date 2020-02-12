FactoryBot.define do
  factory :shift do
    role_id { 1 }
    start_time { DateTime.new(2001,2,3,13,5,6) }
    end_time { DateTime.new(2001,2,3,16,0,0) }
    staff_required { 5 }
    number_of_invited_staff { 3 }
    job_type { "Waiting staff" }

    trait :barista do
      job_type { "Barista" }
    end

    trait :am do
      start_time { DateTime.new(2001,2,3,4,5,6) }
    end

    trait :pm do
      start_time { DateTime.new(2001,2,3,23,5,6) }
    end

    trait :waiting_staff_pm do
      start_time { DateTime.new(2001,2,3,14,5,6) }
      job_type { "Waiting staff" }
    end

    trait :role_2 do
      role_id { 2 }
    end
  end
end
