class CreateSubscribes < ActiveRecord::Migration[7.0]
  def change
    create_table :subscribes do |t|
      t.belongs_to :user
      t.integer    :current_user
      t.timestamps 
    end
  end
end
