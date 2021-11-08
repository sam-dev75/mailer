class User < ApplicationRecord
  def change
    create_table :users do |t|
    t.string :name
    t.string :email
    t.timestamps
    end
  end
  
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end

