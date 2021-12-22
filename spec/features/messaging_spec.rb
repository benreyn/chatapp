require "rails_helper"
require "support/features/clearance_helpers"

RSpec.feature "Messaging", type: :feature do
  scenario "user creates a new conversation" do
    user = FactoryBot.create(:user)
    user_2 = FactoryBot.create(:user)

    sign_in_with user.email, "password"
    click_on "Start a new conversation"
    click_on "Chat"

    expect(page).to have_content("Conversation with #{user_2.email}")
  end

  scenario "user sends a message" do
    user = FactoryBot.create(:user)
    user_2 = FactoryBot.create(:user)
    conversation = FactoryBot.build(:conversation)
    conversation.users << user
    conversation.users << user_2
    conversation.save!

    sign_in_with user.email, "password"
    click_on "Your active conversations"
    click_on user_2.email
    fill_in :message_text, with: "Hello"
    click_on "Send"

    expect(page).to have_content("From: #{user.email}")
    expect(page).to have_content("Hello")
  end
end
