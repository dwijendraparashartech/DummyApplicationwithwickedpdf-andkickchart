class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  # def index
  #   @orders = Order.all
  # end
  

  def completed_tasks
   render json: Task.group_by_day(:completed_at).count
   # render json: Task.group_by_day(:completed_at).countcount.chart_json
  end

    def index
    @orders = Order.all
    respond_to do |format|
      format.html
      format.pdf do
        render template: "orders/index.html.erb",
          pdf: "Orders: #{@orders.count}",
          layout: 'application.html',
          javascript_delay: 3000
      end
    end
  end

  # GET /orders/1 or /orders/1.json
  # def show
  # end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render template: "orders/show.html.erb",
          pdf: "Order ID: #{@order.id}"
      end
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:price, :status)
    end
end
