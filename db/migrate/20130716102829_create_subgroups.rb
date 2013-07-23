class CreateSubgroups < ActiveRecord::Migration
  def change
    create_table :subgroups do |t|
      t.string :name
      t.references :course

      t.timestamps
    end
  end
end
