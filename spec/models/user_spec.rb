require 'spec_helper'

describe User do

  it "lists all the users" do
    user = User.create(:username => "admin")
    users = User.all
    expect("admin").to eq users.first.username
  end

  

end
