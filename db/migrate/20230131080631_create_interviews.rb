class CreateInterviews < ActiveRecord::Migration[7.0]
  def change
    create_table :interviews do |t|
      t.belongs_to :user
      t.belongs_to :job
      t.string :date
      t.string :address
      t.string :status, default: "in progress"
      t.timestamps
    end
  end
end
