class CreateVerifyTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :verify_tokens do |t|
      t.string :token
      t.string :cellphone
      t.datetime :expired_at
      t.timestamps
    end

    add_index :verify_tokens, [:cellphone, :token]
  end
end
