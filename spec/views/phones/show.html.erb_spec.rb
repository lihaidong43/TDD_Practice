require 'spec_helper'


describe "phones/show" do
  before(:each) do
    set_user_session(create(:admin))
    @phone = assign(:phone, stub_model(Phone,

      :type => ""


    ))

  end

  it "renders attributes in <p>" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers



    rendered.should match(//)


  end
end
