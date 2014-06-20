class Contact < ActiveRecord::Base
  validates :title, presence: true
  validates :message, presence: true
  belongs_to :store
end
