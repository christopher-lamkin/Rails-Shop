require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  context "#index" do
    before(:each) do
      @first_product = Product.create(product_name: 'Toy Firetruck', product_description: 'It has 8 wheels, and is red and shoots water out of a hose', price: 19.99)
      @second_product = Product.create(product_name: 'French Press', product_description: "Taste coffee like you've never tasted it before", price: 12.95)
    end

    it 'responds with success status' do
      get :index
      expect(response.status).to eq 200
    end

    it 'assigns products variable to all created products' do
      get :index
      expect(assigns[:products]).to eq [@first_product, @second_product]
    end

    it 'renders correct view' do
      get :index
      expect(response).to have_rendered(:index)
    end
  end

  context '#show' do
    before(:each) do
      @product = Product.create(product_name: 'Toy Firetruck', product_description: 'It has 8 wheels, and is red and shoots water out of a hose', price: 19.99)
    end

    it 'responds with success status' do
      get :show, id: @product.id
      expect(response.status).to eq 200
    end

    it 'assigns the product variable to created product' do
      get :show, id: @product.id
      expect(assigns[:product]).to eq @product
    end

    it 'renders correct view' do
      get :show, id: @product.id
      expect(response).to have_rendered(:show)
    end
  end

  context "#new" do
    it 'responds with a success status' do
      get :new
      expect(response.status).to eq 200
    end

    it 'assigns the product variable to a new product' do
      get :new
      expect(assigns[:product]).to be_a_new(Product)
    end

    it 'renders correct view' do
      get :new
      expect(response).to have_rendered(:new)
    end
  end

  context '#create' do
    let(:params) { { product: { product_name: 'Coffee Filter', product_description: "One of the greatest filters you've ever seen", price: 5.99} }}
    it 'responds with redirect status' do
      post :create, params
      expect(response.status).to eq 302
    end

    it 'increases the number of products by 1' do
      expect{
        post :create, params
      }.to change(Product.all, :size).by(1)
    end
  end

  context "#edit" do
    before(:each) do
      @product = Product.create(product_name: 'Toy Firetruck', product_description: 'It has 8 wheels, and is red and shoots water out of a hose', price: 19.99)
    end

    it 'responds with success status' do
      get :edit, id: @product.id
      expect(response.status).to eq 200
    end

    it 'assigns the product variable to the created product' do
      get :edit, id: @product
      expect(assigns[:product]).to eq @product
    end

    it 'renders correct view' do
      get :edit, id: @product
      expect(response).to have_rendered(:edit)
    end
  end

  context "#update" do
    let(:updated_params) { { product: { product_name: 'Six-Pack of Coffee Filters', product_description: "Six of the greatest filters you've ever seen", price: 5.99}, id: @product.id }}
    before(:each) do
      @product = Product.create(product_name: 'Coffee Filter', product_description: "One of the greatest filters you've ever seen", price: 5.99)
    end

    it 'responds with redirect status' do
      put :update, updated_params
      expect(response.status).to eq 302
    end

    it 'successfully updates product info' do
      put :update, updated_params
      @product.reload
      expect(@product.product_name).to eq 'Six-Pack of Coffee Filters'
      expect(@product.description).to eq "Six of the greatest filters you've ever seen"
    end
  end

  context "#destroy" do
    before(:each) do
      @product = Product.create(product_name: 'Toy Firetruck', product_description: 'It has 8 wheels, and is red and shoots water out of a hose', price: 19.99)
    end
    it 'responds with redirect status' do
      delete :destroy, id: @product.id
      expect(response.status).to eq 302
    end

    it 'reduces the product count by one' do
      expect {
        delete :destroy, id: @product.id
      }.to change(Product.all, :size).by(-1)
    end
  end
end
