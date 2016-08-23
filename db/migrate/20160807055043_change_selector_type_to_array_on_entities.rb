class ChangeSelectorTypeToArrayOnEntities < ActiveRecord::Migration
 
  def up
  change_column :entities, :selector, :text, array: true
  end

  def down
  change_column :entities, :selector , :string
  end

end
