class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
    	t.string :name
    	t.text :description
    	t.datetime :due_date
    	t.datetime :published

    	t.references :subgroup

      t.timestamps
    end
  end
end
