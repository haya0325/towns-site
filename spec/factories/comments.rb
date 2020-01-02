FactoryBot.define do

  factory :comment do
    rate              {"3"}
    content           {"いいね"}
    association :category
    association :station
    association :user
  end

end