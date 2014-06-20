class Group < ActiveRecord::Base
  self.inheritance_column = nil
  validates :name, presence: true
  validates :location, presence: true, uniqueness: {scope: :name,
                                                    message: 'Already exists a group with the same name at the same location'}
  validates :type, presence: true

  belongs_to :store
  has_many :products

  def group_select_name
    @s = Store.find(store_id)

    return "#{@s.name} - #{name}"
  end
end
