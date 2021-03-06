class StoreController < ApplicationController
     
      before_filter :find_cart, :except => :empty_cart
      
  def index
    @products = Product.find_products_for_sale
  end
  
    
  def add_to_cart
    begin
      product = Product.find(params[:id])
      quantity = Integer(params['quantity']) 
     
   rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid product #{params[:id]}" )
      redirect_to_index("Invalid product" )
    else
      @cart = find_cart
      @current_item = @cart.add_product(product, quantity)
      respond_to do |format|
         format.js if request.xhr?
         format.html {redirect_to_index}
      end
    end
  end
  
  def remove_from_cart
     begin
       product = Product.find(params[:id])
     rescue ActiveRecord::RecordNotFound
       logger.error("Attempt to access invalid product #{params[:id]}")
       redirect_to_index("Invalid product" )
     else
       @cart = find_cart
       @current_item = @cart.remove_product(product)
       respond_to do |format|
          format.js if request.xhr?
          format.html {redirect_to_index}
     end
   end
  end
  
   
  def checkout
    if @cart.items.empty?
      redirect_to_index("Your cart is empty")
    else
      @order = Order.new
    end
  end
  

  
  def save_order
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(@cart)
    if @order.save
      # -- email part
      email = 'kokirala@navionicsindia.com'
      recipient = @order.name
      mail = @order.email
      subject ='Thank you'
      message = 'Your order will be delivered soon'
      Emailer.deliver_contact(recipient, mail, subject, message)
      return if request.xhr?
      # -- end of email part
      session[:cart] = nil
      redirect_to_index("Thank you for your order")
    else
      render :action => 'checkout'
    end
  end
  

  def empty_cart
    session[:cart] = nil
    redirect_to_index
  end
  
  def sendmail
    
  end

private

  
  def redirect_to_index(msg = nil)
    flash[:notice] = msg if msg
    redirect_to :action => 'index'
  end
  
      
  def find_cart
    @cart = (session[:cart] ||= Cart.new)
  end
  
  def find_or_make_cart
    @cart = (session[:cart] ||= Cart.new)
  end


protected

  def authorize
  end
end

