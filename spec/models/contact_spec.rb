require 'spec_helper'


describe Contact do
  it 'has three phone number ' do
    expect(create(:contact).phones).to have(3).items
  end
  it 'is valid with firstname ,lastname and email' do
    expect(create(:contact)).to be_valid
  end

  it 'is invalid without firstname' do
    expect(build(:contact,:firstname => nil)).to have(1).errors_on(:firstname)
  end

  it 'is invalid without lastname' do
    expect(build(:contact,:lastname => nil)).to have(1).errors_on(:lastname)
  end

  it 'is invalid without email address' do
    expect(build(:contact,:email => nil)).to have(1).errors_on(:email)
  end

  it 'is invalid with duplicate email address' do
    create(:contact,:email => 'lihaidong43@163.com')
    expect(build(:contact,:email=> 'lihaidong43@163.com')).to have(1).errors_on(:email)
  end

  it "returns contact's full name as string" do
    expect(build(:contact,:firstname => 'li',:lastname => 'haidong').name).to eq('li haidong')
  end

  describe 'filter last name by letter' do
    before{
      @john = create(:contact,:lastname => 'li',:firstname => 'alice')
      @jack = create(:contact,:lastname => 'li',:firstname => 'billy')
      @han = create(:contact,:lastname => 'han')
    }

    context 'matching letter' do
      it 'returns a sorted array of results that match' do
        expect(Contact.by_letter('l')).to eq [@john,@jack]
      end
    end

    context 'non-matching letter' do
      it 'only returns contacts whith provide starting letter' do
        expect(Contact.by_letter('b')).to_not include @john
      end
    end
  end
end

