class CreateUsers < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :username, :email
      t.timestamps
    end
  end
end
