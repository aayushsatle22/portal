class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :jobtype
      t.integer :salary
      t.string :location
      t.string :description
      t.timestamps
    end
  end
end
