class Articles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name, :summary, :description
    end
  end
end
