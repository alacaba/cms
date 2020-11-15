class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :author
      t.date :published_date
      t.text :summary
      t.text :content

      t.timestamps
    end
  end
end
