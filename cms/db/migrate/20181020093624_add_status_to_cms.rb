class AddStatusToCms < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :status, :string
  end
end
