class AddDataModelForChatFeature < ActiveRecord::Migration[7.0]
  def change
    create_table :conversations do |t|
      t.timestamps null: false
    end

    create_table :conversation_users do |t| 
      t.belongs_to :conversation, index: true, null: false, foreign_key: true
      t.belongs_to :user, index: true, null: false, foreign_key: true
    end

    create_table :messages do |t|
      t.text :text, null: false
      t.belongs_to :conversation, index: true, foreign_key: true, null: false
      t.belongs_to :author, index: true, null: false
      t.datetime :read_at

      t.timestamps null: false
    end

    add_foreign_key :messages, :users, column: :author_id
  end
end
