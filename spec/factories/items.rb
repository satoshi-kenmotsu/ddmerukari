FactoryBot.define do
  factory :item do
    
    name                  {"ねこ"}
    description           {"動物です。"}
    status                {"新品、未使用"}
    price                 {"90000"}
    category_id           {"1"}
    prefecture_id         {"2"}
    delivery_date_id      {"1"}
    delivery_charge_id    {"2"}

  end
end
