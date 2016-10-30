require 'rails_helper'

describe "admin routes", :type => :routing do
  it "routes / to goods#index" do
    expect(:get => "/").to route_to(
      :controller => "goods",
      :action => "index"
    )
  end

  it "routes /goods to goods#index" do
    expect(:get => "/goods").to route_to(
      :controller => "goods",
      :action => "index"
    )
  end

  it "routes /cart to carts#create" do
    expect(:post => "/cart").to route_to(
      :controller => "carts",
      :action => "create"
    )
  end

  it "routes /cart/proceed to carts#proceed" do
    expect(:post => proceed_cart_path).to route_to(
      :controller => "carts",
      :action => "proceed"
    )
  end

  it "routes /cart to carts#destroy" do
    expect(:delete => "/cart").to route_to(
      :controller => "carts",
      :action => "destroy"
    )
  end

  it "routes /cart to carts#show" do
    expect(:get => "/cart").to route_to(
      :controller => "carts",
      :action => "show"
    )
  end
end