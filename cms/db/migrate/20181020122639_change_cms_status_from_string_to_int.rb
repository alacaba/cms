class ChangeCmsStatusFromStringToInt < ActiveRecord::Migration[5.2]
  def change
    change_column :contents, :status, 'numeric USING CAST(status AS numeric)'
  end
end
