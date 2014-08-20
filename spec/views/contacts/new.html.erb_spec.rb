require 'spec_helper'


describe "contacts/new" do
  before(:each) do
    set_user_session(create(:admin))
    assign(:contact, stub_model(Contact,

      :firstname => "MyString",

      :lastname => "MyString",

      :email => "MyString"

    ).as_new_record)
  end

  it "renders new contact form" do
    render


    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => contacts_path, :method => "post" do

      assert_select "input#contact_firstname", :name => "contact[firstname]"

      assert_select "input#contact_lastname", :name => "contact[lastname]"

      assert_select "input#contact_email", :name => "contact[email]"

    end

  end
end
