class AdsType < ApplicationRecord
  validates :name, :uniqueness => true
  has_many :ads, :dependent => :restrict_with_error
  before_destroy :check_ads_count, :check_last_type

  def check_ads_count
    ads.count == 0
  end

  def check_last_type
    AdsType.count > 1
  end
end
