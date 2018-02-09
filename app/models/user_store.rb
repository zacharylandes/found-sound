class UserStore < ApplicationRecord
  belongs_to :user 
  belongs_to :store
  enum user_type: ["store_manager", "store_admin"]

end
