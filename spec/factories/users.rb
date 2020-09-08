FactoryBot.define do
  factory :user do
    nickname              { 'フリマ太郎' }
    email                 { 'sample@gmail.com' }
    password              { 'aaa000' }
    password_confirmation { password }
    family_name { 'フリマ' }
    first_name { '太郎' }
    family_name_kana { 'フリマ' }
    first_name_kana { 'タロウ' }
    birth_date { '2020-09-07' }
  end
end
