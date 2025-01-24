class AddUnsubscribeTokenToSubscribers < ActiveRecord::Migration[8.0]
  def change
    add_column :subscribers, :unsubscribe_token, :string
    add_index :subscribers, :unsubscribe_token
  end
end
