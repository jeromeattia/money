class Identities < ActiveRecord::Migration
  def up
    create_table "identities", :force => true do |t|
      t.string   "name"
      t.string   "email"
      t.string   "password_digest"
      t.datetime "created_at",      :null => false
      t.datetime "updated_at",      :null => false
    end
  end

  def down
  end
end
