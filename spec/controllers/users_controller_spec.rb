# frozen_string_literal: true

describe 'GET #index' do
  it 'profile user' do
    user = Factory(:user)
    get :index
    expect(assigns(:user)).to eq([user])
  end

  it 'renders the :index view' do
    get :index
    expect(response).to render_template :index
  end
end

describe 'GET #show' do
  it 'show profile user' do
    user = Factory(:user)
    expect(assigns(:user)).to eq(user)
  end

  it 'renders the #show view' do
    expect(response).to render_template :show
  end
end
describe 'POST create' do
  context 'with valid attributes' do
    it 'creates a new user' do
      expect do
        post :create, user: Factory.attributes_for(:user)
      end.to change(user, :count).by(1)
    end

    it 'redirects to the new user' do
      post :create, user: Factory.attributes_for(:user)
      expect(response).to redirect_to user.last
    end
  end

  context 'with invalid attributes' do
    it 'does not save the new user' do
      expect do
        post :create, user: Factory.attributes_for(:invalid_user)
      end.to_not change(user, :count)
    end

    it 're-renders the new method' do
      post :create, user: Factory.attributes_for(:invalid_user)
      expect(rsponse).to render_template :new
    end
  end
end

describe 'POST create' do
  context 'with valid attributes' do
    it 'creates a new user' do
      expect do
        post :create, user: Factory.attributes_for(:user)
      end.to change(user, :count).by(1)
    end

    it 'redirects to the new user' do
      post :create, user: Factory.attributes_for(:user)
      expect(response).to redirect_to User.last
    end
  end

  context 'with invalid attributes' do
    it 'does not save the new user' do
      expect do
        post :create, user: Factory.attributes_for(:invalid_user)
      end.to_not change(User, :user)
    end

    it 're-renders the new method' do
      post :create, user: Factory.attributes_for(:invalid_user)
      expect(rsponse).to render_template :new
    end
  end
end
