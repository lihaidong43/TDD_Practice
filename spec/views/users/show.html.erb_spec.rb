require 'spec_helper'


describe "users/show" do
  before(:each) do
    set_user_session(create(:admin))
    @user = assign(:user, stub_model(User,

      :email => "Email",

      :password => "Password",

      :admin => false


    ))

  end

  it "renders attributes in <p>" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers



    rendered.should match(/Email/)



    rendered.should match(/Password/)



    rendered.should match(/false/)


  end
end
