require 'spec_helper'


describe "users/index" do
  before(:each) do
    set_user_session(create(:admin))
    assign(:users, [

      stub_model(User,

        :email => "Email",

        :password => "Password",

        :admin => false


      ),


      stub_model(User,

        :email => "Email",

        :password => "Password",

        :admin => false


      )


    ])
  end

  it "renders a list of users" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers



    assert_select "tr>td", :text => "Email".to_s, :count => 2



    assert_select "tr>td", :text => "Password".to_s, :count => 2



    assert_select "tr>td", :text => false.to_s, :count => 2


  end
end
