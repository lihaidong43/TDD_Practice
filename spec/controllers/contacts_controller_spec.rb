require 'spec_helper'


describe ContactsController do

  shared_examples('public access to contacts') do
    describe 'GET #index' do
      before{
        @one = create(:contact,:firstname => 'alice',:lastname => 'lee')
        @two = create(:contact,:firstname => 'billy',:lastname => 'li')
        @three = create(:contact,:lastname => 'jordan')
      }
      context 'with params[:letter]' do
        before{ get :index,:letter => 'l' }

        it 'populates an array of contacts starting with the letter' do
          expect(assigns(:contacts)).to match_array([@one,@two])
        end
      end

      context 'without params[:letter]'do
        before{ get :index }
        it 'populates array of all contacts ' do
          expect(assigns(:contacts)).to match_array([@one,@two,@three])
        end
      end

      context 'json output ' do
        before{ get :index,:format => :json }
        it 'return json type' do
          expect(response.headers['Content-Type']).to include 'application/json'
        end

        it 'return json data' do
          expect(response.body).to eq([@one,@two,@three].to_json)
        end
      end

      it 'renders the :index view'do
        get :index
        expect(response).to render_template :index
      end
    end

    describe 'GET #show' do
      let(:contact){ create(:contact)}
      before{
        get :show,:id => contact.id
      }
      it 'assigns the requested contact to @contact ' do
        expect(assigns(:contact)).to eq contact
      end

      it 'renders the :show view' do
        expect(response).to render_template :show
      end
    end

  end


  shared_examples('full access to contacts') do

    describe 'GET #new' do
      before{get :new}
      it 'assign a new contact to @contact' do
        expect(assigns(:contact)).to be_a_new(Contact)
      end
      it 'render the :new view' do
        expect(response).to render_template :ne
      end
    end

    describe 'GET #edit' do
      let(:contact){ create(:contact) }
      before{
        get :edit,:id => contact.id
      }
      it 'assign the requested contact the @contact' do
        expect(assigns(:contact)).to eq contact
      end

      it 'render the :edit view' do
        expect(response).to render_template :edit
      end
    end

    describe 'POST #create' do
      context 'with valid attributes' do
        let(:contact){attributes_for(:contact)}

        it 'can create contact' do
          expect{post :create,:contact => contact}.to change(Contact,:count).by(1)
        end

        it 'redirects to Contact#show' do
          post :create,:contact => contact
          expect(response).to redirect_to contact_path(assigns(:contact))
        end
      end

      context 'with invalid attributes' do
        let(:contact){attributes_for(:invalid_contact)}
        it 'can not create contact' do
          expect{post :create ,:contact => contact}.to_not change(Contact,:count)
        end

        it 'render :edit view' do
          post :create,:contact => contact
          expect(response).to render_template :new
        end
      end

    end

    describe 'PUT #update' do
      before{
        @contact = create(:contact)
      }
      context 'with valid attributes ' do
        before{put :update,:id => @contact.id,:contact => attributes_for(:contact,:firstname => 'li',:lastname => 'haidong')}
        it 'can update to database' do
          expect(assigns(:contact).name).to eq 'li haidong'
        end

        it 'redirect to :index path' do
          expect(response).to redirect_to contact_path(@contact)
        end
      end

      context 'with invalid attributes' do
        before{
          put :update,:id => @contact.id,:contact => attributes_for(:invalid_contact)
        }
        it 'can not update contact to database' do
          expect(assigns(:contact)).to eq @contact
        end

        it 'render the :edit view' do
          expect(response).to render_template :edit
        end
      end
    end

    describe 'DELETE #destroy' do
      before{ @contact = create(:contact) }
      it 'can destroy contact from database' do
        expect{
          delete :destroy,:id => @contact.id
        }.to change(Contact,:count).by(-1)
      end

      it 'render the :index view' do
        delete :destroy,:id => @contact.id
        expect(response).to redirect_to contacts_path
      end
    end
  end


  describe 'admin access contacts' do
    before {
      set_user_session(create(:admin))
    }
    include_examples 'public access to contacts'
    include_examples 'full access to contacts'
  end

  describe 'user access contacts' do
    before {
      set_user_session(create(:user))
    }
    include_examples 'public access to contacts'
    include_examples 'full access to contacts'
  end

  describe 'guess access contacts' do
    #include_examples 'public access to contacts'

    context 'login validate' do
      after{ expect(response).to redirect_to new_sessions_path}

      describe 'GET #new' do
        it 'requires login' do
          get :new
        end
      end

      describe 'POST #create' do
        it 'requires login' do
          post :create
        end
      end

      describe 'PUT #update' do
        it 'requires login' do
          put :update ,:id => 1
        end
      end

      describe 'DELETE #delete' do
        it 'require login' do
          delete :destroy,:id => 1
        end
      end
    end
  end

end

