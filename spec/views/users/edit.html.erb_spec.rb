require 'spec_helper'


describe "users/edit" do
  before(:each) do
    set_user_session(create(:admin))
    @user = assign(:user, stub_model(User,

      :email => "MyString",

      :password => "MyString",

      :admin => false

    ))

  end

  it "renders the edit user form" do
    render


    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do

      assert_select "input#user_email", :name => "user[email]"

      assert_select "input#user_password", :name => "user[password]"

      assert_select "input#user_admin", :name => "user[admin]"

    end

  end
end
