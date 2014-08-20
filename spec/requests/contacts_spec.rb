require 'spec_helper'

feature "Contacts" do
  let(:admin){create(:admin)}
  before(:each) {
    sign_in(admin)
  }
  scenario "GET #/contacts" do
    contact = create(:contact)
    visit contacts_path
    expect(page).to have_content(contact.email)
  end
end
