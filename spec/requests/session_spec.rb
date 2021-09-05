require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /login (new)" do
    get login_path
    expect(response).to render_template(:new)
    expect(response).to have_http_status(200)
  end

  describe "POST / (create)" do
    
  end

  describe "DELETE /logout (destroy)" do
    
  end  
end
