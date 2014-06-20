class Product < ActiveRecord::Base
  self.inheritance_column = nil
  validates :group_id, presence: true
  validates :name, presence: true, uniqueness: {scope: :group_id,
                                                    message: 'Already exists a product with the same name at the same group.'}
  validates :unit_price, presence: true
  validates :wholesale, presence: true
  belongs_to :group
  before_save :check_values

  private
  def check_values
    self.name = self.name.titleize

    if self.unit_price < 0
      self.unit_price = 0
    end

    if self.wholesale < 0
      self.wholesale = 0
    end
  end
end
