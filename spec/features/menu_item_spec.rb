require 'spec_helper'
feature "MenuItem", :js => true do
  let!(:menu) { create :menu }
  let(:menu_item) { create :menu_item }
  before(:each) do
    visit menu_path(menu.id)
  end
  context "index" do
    it "displays name of an item on the menu" do
      expect(page).to have_content(menu_item.name)
    end
  end
  context "create menu item" do
    it "appends the menu item name to the list" do
      name = attributes_for(:menu_item)[:name]
      price = attributes_for(:menu_item)[:price]
      click_on "New Item"
      fill_in "Name", :with => name
      fill_in "Price", :with => price
      click_on "Create Item"
      expect(page).to have_content(name)
      expect(page).to have_content(price)
    end
    it "shows the errors if name is taken" do
      click_on "New Item"
      fill_in "Name", :with => menu_item.name
      fill_in "Price", :with => menu_item.price
      click_on "Create Item"
      expect(page).to have_content("Name has already been taken")
    end
     it "shows the errors if name is blank" do
      click_on "New Item"
      click_on "Create Item"
      expect(page).to have_content("Name can't be blank")
    end
    it "shows the errors if price is blank" do
      click_on "New Item"
      click_on "Create Item"
      expect(page).to have_content("Price can't be blank")
    end
  end
end
