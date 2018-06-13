class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  alias authenticate valid_password?

  def self.from_token_payload(payload)
    find(payload['sub'])
  end
end
