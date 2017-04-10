require "rails_helper"

RSpec.describe Type018FooMailer, type: :mailer do
  describe "activation_mail" do
    let(:mail) { Type018FooMailer.activation_mail }

    it "renders the headers" do
      expect(mail.subject).to eq("Mm 001")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
