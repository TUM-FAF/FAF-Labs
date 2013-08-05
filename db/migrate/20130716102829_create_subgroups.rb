class CreateSubgroups < ActiveRecord::Migration
  def change
    create_table :subgroups do |t|
      t.string :name
      t.references :course

      t.timestamps
    end

    add_index :subgroups, :course_id
  end
end
