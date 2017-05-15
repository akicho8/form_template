class CreateType029Articles < ActiveRecord::Migration[5.1]
  def up
    create_table :type029_articles, :force => true do |t|
      t.integer :show_counter
      t.timestamps :null => false
    end
  end
end
