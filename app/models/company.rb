class Company < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :state, presence: true
  has_many :employees, dependent: :destroy

  def to_s
    "#{name},#{state}"
  end
end
