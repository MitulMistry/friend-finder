require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "lists users"
  end

  describe "GET /:id (show)" do
    it "shows user by id"
  end

  describe "GET /signup (new)" do
    it "renders signup form template"
  end

  describe "POST / (create)" do
    it "creates new user"
  end

  describe "GET /edit" do
    it "renders edit form template"
  end  

  describe "PATCH /:id (update)" do
    it "updates user"
  end

  describe "DELETE /:id (destroy)" do
    it "deletes user"
  end
end
