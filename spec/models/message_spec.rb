require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "associations" do
    it { should belong_to(:conversation) }
    it { should belong_to(:author).
                  class_name("User").
                  with_foreign_key("author_id") }
  end
end
