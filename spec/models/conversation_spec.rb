require 'rails_helper'

RSpec.describe Conversation, type: :model do
  describe "associations" do
    it { should have_many(:conversation_users) }
    it { should have_many(:users).through(:conversation_users) }
    it { should have_many(:messages) }
  end

  describe "#other_user" do
    it "it returns the related user not passed as an argument" do
      user_1 = FactoryBot.create(:user)
      user_2 = FactoryBot.create(:user)
      conversation = FactoryBot.build(:conversation)
      conversation.users << user_1
      conversation.users << user_2
      conversation.save!

      expect(conversation.other_user(user_1)).to eq user_2
    end
  end
end
