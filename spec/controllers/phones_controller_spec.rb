require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.


describe PhonesController do
  let(:admin){create(:admin)}
  before(:each) {
    set_user_session(admin)
  }

  # This should return the minimal set of attributes required to create a valid
  # Phone. As you add validations to Phone, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "type" => "" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PhonesController. Be sure to keep this updated too.
  def valid_session
    {}
  end


  describe "GET index" do
    it "assigns all phones as @phones" do
      phone = Phone.create! valid_attributes
      get :index
      assigns(:phones).should eq([phone])
    end
  end


  describe "GET show" do
    it "assigns the requested phone as @phone" do
      phone = Phone.create! valid_attributes
      get :show, {:id => phone.to_param}
      assigns(:phone).should eq(phone)
    end
  end

  describe "GET new" do
    it "assigns a new phone as @phone" do
      get :new
      assigns(:phone).should be_a_new(Phone)
    end
  end

  describe "GET edit" do
    it "assigns the requested phone as @phone" do
      phone = Phone.create! valid_attributes
      get :edit, {:id => phone.to_param}
      assigns(:phone).should eq(phone)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Phone" do
        expect {
          post :create, {:phone => valid_attributes}
        }.to change(Phone, :count).by(1)
      end

      it "assigns a newly created phone as @phone" do
        post :create, {:phone => valid_attributes}
        assigns(:phone).should be_a(Phone)
        assigns(:phone).should be_persisted
      end

      it "redirects to the created phone" do
        post :create, {:phone => valid_attributes}
        response.should redirect_to(Phone.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved phone as @phone" do
        # Trigger the behavior that occurs when invalid params are submitted
        Phone.any_instance.stub(:save).and_return(false)
        post :create, {:phone => { "type" => "invalid value" }}
        assigns(:phone).should be_a_new(Phone)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Phone.any_instance.stub(:save).and_return(false)
        post :create, {:phone => { "type" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested phone" do
        phone = Phone.create! valid_attributes
        # Assuming there are no other phones in the database, this
        # specifies that the Phone created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Phone.any_instance.should_receive(:update_attributes).with({ "type" => "" })
        put :update, {:id => phone.to_param, :phone => { "type" => "" }}
      end

      it "assigns the requested phone as @phone" do
        phone = Phone.create! valid_attributes
        put :update, {:id => phone.to_param, :phone => valid_attributes}
        assigns(:phone).should eq(phone)
      end

      it "redirects to the phone" do
        phone = Phone.create! valid_attributes
        put :update, {:id => phone.to_param, :phone => valid_attributes}
        response.should redirect_to(phone)
      end
    end

    describe "with invalid params" do
      it "assigns the phone as @phone" do
        phone = Phone.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Phone.any_instance.stub(:save).and_return(false)
        put :update, {:id => phone.to_param, :phone => { "type" => "invalid value" }}
        assigns(:phone).should eq(phone)
      end

      it "re-renders the 'edit' template" do
        phone = Phone.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Phone.any_instance.stub(:save).and_return(false)
        put :update, {:id => phone.to_param, :phone => { "type" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested phone" do
      phone = Phone.create! valid_attributes
      expect {
        delete :destroy, {:id => phone.to_param}
      }.to change(Phone, :count).by(-1)
    end

    it "redirects to the phones list" do
      phone = Phone.create! valid_attributes
      delete :destroy, {:id => phone.to_param}
      response.should redirect_to(phones_url)
    end
  end

end

