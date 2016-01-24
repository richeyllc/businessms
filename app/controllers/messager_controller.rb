class MessagerController < ApplicationController
  protect_from_forgery :except => [:incoming]
  # sample params:
  #
  #Parameters: {"ToCountry"=>"US", 
  #"ToState"=>"UT", 
  #"SmsMessageSid"=>"SM51531a4fe1c6f13b27844be015e0ebba", 
  #"NumMedia"=>"0", 
  #"ToCity"=>"SALT LAKE CITY", 
  #"FromZip"=>"84770", 
  #"SmsSid"=>"SM51531a4fe1c6f13b27844be015e0ebba", 
  #"FromState"=>"UT", 
  #"SmsStatus"=>"received", 
  #"FromCity"=>"ST GEORGE", 
  #"Body"=>"Hello", 
  #"FromCountry"=>"US", 
  #"To"=>"+14352720332", 
  #"ToZip"=>"84104", 
  #"NumSegments"=>"1", 
  #"MessageSid"=>"SM51531a4fe1c6f13b27844be015e0ebba", 
  #"AccountSid"=>"AC5195465a78f629bfd7231f6131fd65c4", 
  #"From"=>"+14356691878", 
  #"ApiVersion"=>"2010-04-01"}
  def incoming
    params.inspect
    cust = PhoneNumber.find_by(number: params[:To]).customer
    if cust.nil?
      # we received a message to a number that we don't know about
      # render the error message...
      render 'error'
    end
    from = PhoneNumber.find_by(number: params[:From])
    if from.nil?
      # create a new phone number for this incoming number
      from = PhoneNumber.create(ours: false, number: params[:From], customer: cust)
    end
    # Now we need to get the return message from the database.
    @response_message = cust.get_mapping_from_message(params[:Body].strip)
    if @response_message.nil?
      render 'error'
    else

    end
  end
end
