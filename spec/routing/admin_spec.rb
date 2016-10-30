require 'rails_helper'

# TODO: redirect request spec here

describe "admin routes", :type => :routing do
  it "routes /admin/goods to admin/goods#index" do
    expect(:get => "/admin/goods/").to route_to(
      :controller => "admin/goods",
      :action => "index"
    )
  end

  it "routes /admin/goods to admin/goods#create" do
    expect(:post => "/admin/goods").to route_to(
      :controller => "admin/goods",
      :action => "create"
    )
  end

  it "routes /admin/goods to admin/goods#update" do
    expect(:put => "/admin/goods/1").to route_to(
      :controller => "admin/goods",
      :action => "update",
      :id => "1"
    )
  end

  it "routes /admin/goods to admin/goods#destroy" do
    expect(:delete => "/admin/goods/1").to route_to(
      :controller => "admin/goods",
      :action => "destroy",
      :id => "1"
    )
  end
end