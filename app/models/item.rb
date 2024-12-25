class Item < ApplicationRecord
    validates :item_name, presence: true
    validates :inventory_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
