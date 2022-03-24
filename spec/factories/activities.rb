FactoryBot.define do
  factory :activity do
    user_id {} 
    sequence(:name) { |n| "Activity #{n}" }
    amount { 10 }

    factory :activity_with_categories do
      transient do
        categories_count { 5 }
      end

      categories do
        Array.new(categories_count) { association(:category) }
      end
    end
  end
end