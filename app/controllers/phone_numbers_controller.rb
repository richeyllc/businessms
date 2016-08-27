class PhoneNumbersController < ApplicationController
  before_action :set_phone_number, only: [:show, :edit, :update, :destroy]
  before_action :current_customer
  # GET /phone_numbers
  # GET /phone_numbers.json
  def index
    @phone_numbers = current_customer.phone_numbers
    # @phone_numbers = PhoneNumber.all
  end

  # GET /phone_numbers/1
  # GET /phone_numbers/1.json
  def show
  end

  # GET /phone_numbers/new
  def new
    @phone_number = PhoneNumber.new
  end

  # GET /phone_numbers/1/edit
  def edit
  end

  # POST /phone_numbers
  # POST /phone_numbers.json
  def create
    @phone_number = PhoneNumber.new(phone_number_params)

    respond_to do |format|
      if @phone_number.save
        format.html { redirect_to @phone_number, notice: 'Phone number was successfully created.' }
        format.json { render :show, status: :created, location: @phone_number }
      else
        format.html { render :new }
        format.json { render json: @phone_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phone_numbers/1
  # PATCH/PUT /phone_numbers/1.json
  def update
    respond_to do |format|
      if @phone_number.update(phone_number_params)
        format.html { redirect_to customer_phone_number_path(session[:current_customer]["id"], @phone_number), notice: 'Phone number was successfully updated.' }
        format.json { render :show, status: :ok, location: @phone_number }
      else
        format.html { render :edit }
        format.json { render json: @phone_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phone_numbers/1
  # DELETE /phone_numbers/1.json
  def destroy
    @phone_number.destroy
    respond_to do |format|
      format.html { redirect_to customer_phone_numbers_url(session[:current_customer]["id"]), notice: 'Phone number was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phone_number
      @phone_number = PhoneNumber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phone_number_params
      params.require(:phone_number).permit(:number, :ours, :customer_id, :our_metadata, :customer_metadata)
    end

    def current_customer
      Customer.find(params[:customer_id])
    end
end
