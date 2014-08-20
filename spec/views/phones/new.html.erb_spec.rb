require 'spec_helper'


describe "phones/new" do
  before(:each) do
    set_user_session(create(:admin))
    assign(:phone, stub_model(Phone,

      :type => ""

    ).as_new_record)
  end

  it "renders new phone form" do
    render


    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => phones_path, :method => "post" do

      assert_select "input#phone_type", :name => "phone[type]"

    end

  end
end
