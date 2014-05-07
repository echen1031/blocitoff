require 'spec_helper'

describe ListsController do
  describe 'GET index' do
    let(:user) { FactoryGirl.create(:user)}

    it 'populates an array of @lists' do
      list = List.create(user: user, description: 'Garden work')
      list2 = List.create(user: user, description: 'Beat up a kitten')
      get :index
      expect(assigns(:lists)).to eq([list, list2])
    end

    it 'renders the :index view' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #new' do
    it 'assigns a new List to @list' do
      get :new
      expect(assigns(:list)).to be_a_new(List) 
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template('new')
    end
  end 

  describe 'GET #show' do
    let(:user) { FactoryGirl.create(:user)}

    it 'assigns the requested list to @list' do
      list = List.create(user: user, description: 'Garden work')
      get :show, id: list.id
      expect(assigns(:list)).to eq list
    end

    it 'renders the :show template' do
      list = List.create(user: user, description: 'Garden work')
      get :show, id: list.id
      expect(response).to render_template('show')
    end
  end 

  describe 'GET #edit' do
    let(:user) { FactoryGirl.create(:user)}

    it 'assigns the requested list to @list' do
      list = List.create(user: user, description: 'Garden work')
      get :edit, id: list.id
      expect(assigns(:list)).to eq list
    end

    it 'renders the :show template' do
      list = List.create(user: user, description: 'Garden work')
      get :show, id: list.id
      expect(response).to render_template('show')
    end
  end 

  describe 'POST creating List with valid attributes and nested list_items attributes' do
    let(:user) { FactoryGirl.create(:user)}
    let(:list_item) { FactoryGirl.create(:list_item)}

    context 'with valid attributes' do
      it "creates a new list" do
        sign_in user
        expect{ 
          post :create, list: FactoryGirl.attributes_for(:list)
        }.to change(List,:count).by(1) 
      end 

      it 'creates a new list with items' do
        sign_in user
        list_item_attr = FactoryGirl.attributes_for(:list_item)
         expect{ 
           post :create, list: list_item_attr
         }.to change(ListItem, :count).by(1) 
      end

      it 'redirects to the new list' do
        sign_in user
        list_attr = FactoryGirl.attributes_for(:list, user_id: user.id)
        post :create, list: list_attr
        expect(response).to redirect_to List.last
      end
    end 

    context 'with invalid attributes' do
      it 'does not create a new list' do
        sign_in user
        expect{
        post :create, list: FactoryGirl.attributes_for(:invalid_list)
        }.to_not change(List,:count) 
      end

      it 're-renders the new list' do
        sign_in user
        post :create, list: FactoryGirl.attributes_for(:invalid_list)
        expect(response).to render_template :new
      end 
    end
  end

  describe 'PUT #update' do
    let(:user) { FactoryGirl.create(:user)}
    before :each do
      @list = List.create(user: user, description: 'Garden work')
    end

    context 'valid vattributes' do
      it 'located the requested @list' do
        put :update, id: @list, list: FactoryGirl.attributes_for(:list)
        expect(assigns(:list)).to eq @list
      end

      it 'changes @list attributes' do
        put :update, id: @list, 
          list: FactoryGirl.attributes_for(:updated_list)
        @list.reload
        expect{ @list.description.to eq('Yard work')}
      end

      it 'redirects to updated list' do
        put :update, id: @list, list: FactoryGirl.attributes_for(:list)
        expect(response).to redirect_to @list
      end
    end

    context 'invalid attributes' do
      it 'locates the requested @list' do
        put :update, id: @list, list: FactoryGirl.attributes_for(:invalid_list)
        expect(assigns(:list)).to eq @list
      end

      it 'does not change @list attributes' do
        put :update, id: @list, list: FactoryGirl.attributes_for(:invalid_list)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    let(:user) { FactoryGirl.create(:user)}

    it 'deletes the list' do
      @list = FactoryGirl.create(:list, user: user)
      expect {
        delete :destroy, id: @list
      }.to change(List,:count).by(-1)
    end

    it 'redirects to lists@index' do
      @list = FactoryGirl.create(:list, user: user)
      delete :destroy, id: @list
      expect(response).to redirect_to lists_path
    end
  end
end
