class MenuItemsController < ApplicationController
  def index
    @menu_items = MenuItem.all
    @menu_item = MenuItem.new
  end

  def show
    @menu_item = MenuItem.find params[:id]
  end

  def create
    @menu_item = MenuItem.new params[:menu_item]
    if @menu_item.save
      render :json => { :menu_item_template => render_to_string(:partial => 'menu_item', :locals => {:menu_item => @menu_item}) }
    else
      render :json => {:error => @menu_item.errors.full_messages.join(", ")}, :status => :unprocessable_entity
    end
  end
end
