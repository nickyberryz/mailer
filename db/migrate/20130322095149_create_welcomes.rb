class CreateWelcomes < ActiveRecord::Migration
  def change
    create_table :welcomes do |t|
      t.boolean :choose
      t.timestamps
    end
  end
end
