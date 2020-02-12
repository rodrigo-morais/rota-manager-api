FactoryBot.define do
  factory :invited_contract do
    role_id { 1 }
    candidate_name { "Paul" }

    trait :tom_role_1 do
      role_id { 1 }
      candidate_name { "Tom" }
    end

    trait :tom_role_2 do
      role_id { 2 }
      candidate_name { "Tom" }
    end

    trait :will_role_2 do
      role_id { 2 }
      candidate_name { "Will" }
    end
  end
end
