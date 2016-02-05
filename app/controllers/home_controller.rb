class HomeController < ApplicationController
  def index
    # this is the default site landing page
  end
  def choose_customer
    @customers = current_user.customers
    if @customers.count < 2
      # Go to the only customer's mapping page
      current_customer = @customers.first
      session[:current_customer] = current_customer
      redirect_to customer_mappings_path(current_customer)
    else
      # If there is more than one customer, go to a choose_customer page
      redirect_to select_active_customer_path
    end
  end

  def select_active_customer
    @customers = current_user.customers
  end

  def customer_selected
    params.inspect
    session[:current_customer] = Customer.find(params[:chosen_customer])
    redirect_to customer_mappings_path(session[:current_customer])
  end
  def clear_customer
    session[:current_customer] = nil
    redirect_to select_active_customer_path
  end
end
