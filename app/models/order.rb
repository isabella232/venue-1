class Order < ApplicationRecord
  after_initialize :set_default_state, if: :new_record?
  acts_as_shopping_cart_using :order_item

  belongs_to :user

  enum state: { pending: 0, paid: 1 }

  def order_items
    shopping_cart_items
  end
  alias items order_items

  def set_default_state
    self.state ||= :pending
  end
end
