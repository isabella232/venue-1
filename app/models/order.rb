class Order < ApplicationRecord
    acts_as_shopping_cart_using :order_item

    belongs_to :user
    
    def order_items 
        shopping_cart_items
    end
    alias_method :items, :order_items
end
