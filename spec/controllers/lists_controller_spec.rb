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

  describe 'POST #create' do
    let(:user) { FactoryGirl.create(:user)}

    context 'with valid attributes' do
      it "creates a new list" do
        expect{ 
          post :create, list: FactoryGirl.attributes_for(:list, user: user)
        }.to change(List,:count).by(1) 
      end 

      it 'redirects to the new list' do
        post :create, list: FactoryGirl.attributes_for(:list, user: user)
        expect(response).to redirect_to List.last
      end
    end 

    context 'with invalid attributes' do
      it 'does not save the new list in the database'
      it 're-renders the :new template'
    end 
  end
end

