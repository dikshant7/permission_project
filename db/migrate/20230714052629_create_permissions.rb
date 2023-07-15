class CreatePermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :permissions do |t|
      t.string :table_name
      t.string :permission_required

      t.timestamps
    end
  end
end
