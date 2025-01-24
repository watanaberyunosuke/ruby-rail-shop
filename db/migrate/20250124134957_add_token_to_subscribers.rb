class AddTokenToSubscribers < ActiveRecord::Migration[8.0]
  def change
    add_column :subscribers, :token, :string
  end
end
