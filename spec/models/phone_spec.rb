require 'spec_helper'
describe Phone do
  let(:contact){create(:contact)}
  before{contact.phones.create(:type => 'home',:number => '18616115775')}
  it 'does not allow duplicate phone number per contact' do
    mobile =  contact.phones.build(:type => 'mobile',:number => '18616115775')
    expect(mobile).to have(1).errors_on(:number)
  end

  it 'allow two contact share a phone number' do
    expect(create(:contact).phones.build(:type => 'home',:number => '18616115775')).to be_valid
  end
end

