class Store < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :manager_name, presence: true

  before_save :check_names

  has_many :groups
  has_many :contacts

  private
  def check_names
    self.name = self.name.titleize
    self.manager_name = self.manager_name.titleize
  end
end
