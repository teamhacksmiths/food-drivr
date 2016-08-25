require 'ffaker'

FactoryGirl.define do
  factory :donation_item do
    donation nil
    description FFaker::Food.meat
    quantity FFaker::UnitEnglish.mass_abbr
    unit [*1..20].sample
  end
end
