class LineItemsController < ApplicationController
   def index
    @line_items = LineItem.find(:all)

    respond_to do |format|
      format.html
      format.xml  { render :xml => @line_items }
    end
  end

  def show
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @line_item }
    end
  end

  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @line_item }
    end
  end


  def edit
    @line_item = LineItem.find(params[:id])
  end

  def create
    @line_item = LineItem.new(params[:line_item])

    respond_to do |format|
      if @line_item.save
        flash[:notice] = 'LineItem was successfully created.'
        format.html { redirect_to(@line_item) }
        format.xml  { render :xml => @line_item, :status => :created, :location => @line_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @line_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        flash[:notice] = 'LineItem was successfully updated.'
        format.html { redirect_to(@line_item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @line_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to(line_items_url) }
      format.xml  { head :ok }
    end
  end
end
