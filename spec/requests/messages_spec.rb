require 'rails_helper'

RSpec.describe "Messages", type: :request do
  describe "inbox/outbox" do
    before :each do
      @user1 = create_user_and_login
      @user2 = create(:user)
      @user3 = create(:user)

      @message1 = create(:message, sender: @user2, recipient: @user1)
      @message2 = create(:message, sender: @user3, recipient: @user1)
      @message3 = create(:message, sender: @user1, recipient: @user2)
      @message4 = create(:message, sender: @user1, recipient: @user3)
    end

    context "GET /received" do
      it "lists received messages" do
        get received_path
        expect(response).to have_http_status(200)
        expect(response.body).to include(@message1.body[0..20])
        expect(response.body).to include(@message2.body[0..20])
      end
    end

    context "GET /sent" do
      it "lists sent messages" do
        get sent_path
        expect(response).to have_http_status(200)
        expect(response.body).to include(@message3.body[0..20])
        expect(response.body).to include(@message4.body[0..20])
      end
    end
  end

  describe "GET /users/:id/new" do
    it "renders new message form" do
      user1 = create_user_and_login
      user2 = create(:user)

      get new_user_message_path(user2)
      expect(response.body).to include("Compose Message")
      expect(response.body).to include(user2.username)
    end
  end

  describe "POST / (create)" do
    it "creates new message" do
      user1 = create_user_and_login
      user2 = create(:user)
      
      post messages_path, params: {
        message: {
          sender: user1.id,
          recipient: user2.id,
          body: "Test message."
        }
      }

      expect(response).to redirect_to(sent_path)
      follow_redirect!

      expect(respone.body).to include("Sent")
      expect(response.body).to include(message.body)
    end
  end

  describe "DELETE / (destroy)" do
    it "deletes message"
  end
end
