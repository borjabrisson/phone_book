class Company < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :state, presence: true
  has_many :employees, dependent: :destroy

  def to_s
    "#{name},#{state}"
  end
  private
  after_create :expire_cache
  def expire_cache
    ActionController::Base.new.expire_fragment('table_of_all_companies') # 1
  end
end
