class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :type
      t.string :job_description
      t.integer :salarty

      t.timestamps
    end
  end
end
