class CartItem
attr_reader :product, :quantity

  def initialize(product, quantity)
    @product = product
    @quantity = quantity
  end
  
  def increment_quantity(quantity)
    @quantity += quantity
  end
 
  def decrement_quantity(quantity)
    @quantity -= quantity
  end
  
  def price
    @product.price * @quantity
  end
  
  def title
    @product.title
  end
  
end