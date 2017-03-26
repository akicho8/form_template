class CreateSimpleCaptchaData < ActiveRecord::Migration[5.1]
  def up
    create_table :simple_captcha_data do |t|
      t.string :key, :limit => 40
      t.string :value, :limit => 6
      t.timestamps :null => false
    end

    add_index :simple_captcha_data, :key
  end
end
