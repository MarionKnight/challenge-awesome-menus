require 'spec_helper'
describe MenuItemsController do
  let!(:menu) { create :menu }
  let(:menu_item) { create :menu_item }
  context "#index" do
    it "assigns a collection of all menus" do
      get :index, menu_id: menu.id
      expect(assigns(:menu_items)).to eq MenuItem.all
    end
    it "assigns a new item object" do
      get :index, menu_id: menu.id
      expect(assigns(:menu_item)).to be_a_new(MenuItem)
    end
  end

  context "#show" do
    it "assigns the item by params id" do
      get :show, menu_id: menu.id, :id => menu_item.id
      expect(assigns(:menu_item)).to eq menu_item
    end
  end

  context "#create" do
    let(:existing_name) { existing_name = menu_item.name }
    it "creates a item with valid attributes" do
      expect {
        post :create, menu_id: menu.id, :menu_item => attributes_for(:menu_item)
      }.to change { MenuItem.count }.by(1)
    end
    it "doesn't create an item with invalid attributes" do
      expect {
        post :create, menu_id: menu.id, :menu_item => {:name => existing_name}
      }.to change { MenuItem.count }.by(1)
    end
  end
end
