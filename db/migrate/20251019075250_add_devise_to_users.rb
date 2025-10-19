# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def change
    # change_table で安全に追加
    change_table :users, bulk: true do |t|
      t.string :nickname,        null: false, default: ""
      t.string :first_name,      null: false, default: ""
      t.string :last_name,       null: false, default: ""
      t.string :kana_first_name, null: false, default: ""
      t.string :kana_last_name,  null: false, default: ""
      t.date   :birth,           null: false
    end
  end
end