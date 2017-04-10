require 'rails_helper'

RSpec.describe "Type018EmailActivations", type: :request do
  describe "GET /type018_email_activations" do
    it "works! (now write some real specs)" do
      get type018_email_activations_path
      expect(response).to have_http_status(200)
    end
  end
end
