require 'spec_helper'


describe "users/new" do
  before(:each) do
    set_user_session(create(:admin))
    assign(:user, stub_model(User,

      :email => "MyString",

      :password => "MyString",

      :admin => false

    ).as_new_record)
  end

  it "renders new user form" do
    render


    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do

      assert_select "input#user_email", :name => "user[email]"

      assert_select "input#user_password", :name => "user[password]"

      assert_select "input#user_admin", :name => "user[admin]"

    end

  end
end
