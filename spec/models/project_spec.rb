require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { FactoryBot.build(:project) }
  
  it "can be instanciated" do
    expect(project).not_to be nil
  end

  it "can be saved" do
    expect(project.save).to eq true
  end

  it "is invalid without name project" do
    project.name = nil
    expect(project.valid?).to eq false
    expect(project.errors.messages).to have_key(:name)
  end

  it "is invalid without user" do
    project.created_by = nil
    expect(project.valid?).to eq false
    expect(project.errors.messages).to have_key(:created_by)
  end

  it "is invalid with a negative number" do
    project.budget = -1
    expect(project.valid?).to eq false
    expect(project.errors.messages).to have_key(:budget)
  end

  it "is invalid with a 0 euros budget" do
    project.budget = 0
    expect(project.valid?).to eq false
    expect(project.errors.messages).to have_key(:budget)
  end
end
