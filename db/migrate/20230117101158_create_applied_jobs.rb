class CreateAppliedJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :applied_jobs do |t|
      t.belongs_to :user
      t.belongs_to :job
      t.string     :name
      t.string     :surname
      t.string     :email
      t.string     :contactno
      t.string     :experience
      t.timestamps
    end
  end
end
