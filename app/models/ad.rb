class Ad < ApplicationRecord
  belongs_to :ads_type
  belongs_to :user
end
