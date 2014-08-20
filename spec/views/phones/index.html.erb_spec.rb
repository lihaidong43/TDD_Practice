require 'spec_helper'


describe "phones/index" do
  before(:each) do
    set_user_session(create(:admin))
    assign(:phones, [

      stub_model(Phone,

        :type => "mobile"


      ),


      stub_model(Phone,

        :type => "mobile"


      )


    ])
  end

  it "renders a list of phones" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers



    assert_select "tr>td", :text => "mobile".to_s, :count => 2


  end
end
