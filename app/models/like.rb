class Like < ApplicationRecord
  belongs_to :gossip, optional: true
  belongs_to :comment, optional: true
  belongs_to :user, optional: true
end
