require "rails_helper"

RSpec.describe AdminMailer, type: :mailer do
  describe "project_updated" do
    let(:project) { factoryBot.create(:project) }
    let(:mail) { AdminMailer.with(project: project).project_updated }

    it "renders the headers" do
      expect(mail.subject).to eq("Project updated")
      expect(mail.to).to eq(["mrcaoevan@gmail.com"])
      expect(mail.from).to eq(["contact@project.org"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end

  
  end



end
