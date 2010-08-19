class Cart
  attr_reader :items   
  
  def initialize
    @items = []
  end
  
  
  def add_product(product, quantity)
    current_item = @items.find {|item| item.product == product}
    if current_item
      current_item.increment_quantity(quantity)
    else
      current_item = CartItem.new(product, quantity)
      @items << current_item
    end
    current_item
  end
 
 
  def remove_product(product)
    li = self.line_items.find_by_product_id(product)
    if li
      if li.quantity < 2
        li.destroy
      else
        li.quantity -= 1
        li.save
      end
      li
    end
  end
 
      
  def total_price
    @items.sum { |item| item.price }
  end

  def total_items
    @items.sum { |item| item.quantity }
  end




  
end
