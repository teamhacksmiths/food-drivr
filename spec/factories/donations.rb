FactoryGirl.define do
  factory :donation do |d|
    d.donor Donor.all.sample
    d.driver Driver.all.sample
    d.recipient Recipient.all.sample
    d.note 'Blah, blah, blah, blah, blah'
  end
end
