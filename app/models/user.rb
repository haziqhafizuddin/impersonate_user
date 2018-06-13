class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :todos

  # as knock & devise doesn't compatible each other we need to
  # override some part
  # https://github.com/nsarno/knock/issues/70
  alias authenticate valid_password?

  def self.from_token_payload(payload)
    find(payload['sub'])
  end
end
