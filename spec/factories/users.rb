FactoryBot.define do

  factory :user do

    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"橋形"}
    last_name             {"健太郎"}
    first_name_kana       {"はしがた"}
    last_name_kana        {"けんたろう"}
    birth_year_id            {"1"}
    birth_month_id           {"1"}
    birth_day_id             {"3"}
  end

end