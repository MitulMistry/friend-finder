require 'rails_helper'

RSpec.describe "Messages", type: :request do
  describe "GET /received" do
    it "lists received messages"
  end

  describe "GET /sent" do
    it "lists sent messages"
  end

  describe "GET /users/:id/new" do
    it "renders new message form template"
  end

  describe "POST / (create)" do
    it "creates new message"
  end

  describe "DELETE / (destroy)" do
    it "deletes message"
  end
end
