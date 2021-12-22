require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:messages).inverse_of(:author) }
    it { should have_many(:conversation_users) }
    it { should have_many(:conversations).through(:conversation_users) }
  end

  describe "scopes" do
    describe ".no_active_conversation_with" do
      context "when a user has not active conversations" do
        it "returns all users except the passed user" do
          user_1 = FactoryBot.create(:user)
          user_2 = FactoryBot.create(:user)
          user_3 = FactoryBot.create(:user)

          expect(User.no_active_conversation_with(user_1)).
            to match_array(
                 [user_2, user_3]
               )
        end
      end

      context "when a user has active conversations" do
        it "returns users with no active conversation with the passed user" do
          user_1 = FactoryBot.create(:user)
          user_2 = FactoryBot.create(:user)
          user_3 = FactoryBot.create(:user)
          conversation = FactoryBot.build(:conversation)
          conversation.users << user_1
          conversation.users << user_2
          conversation.save!

          expect(User.no_active_conversation_with(user_1))
            .to match_array(
                  [user_3]
                )
        end
      end
    end
  end
end
