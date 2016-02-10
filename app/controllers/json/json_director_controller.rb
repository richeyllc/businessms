class Json::JsonDirectorController < ApplicationController
  load_and_authorize_resource :mapping
  load_and_authorize_resource :phone_numbers, through: :mapped_phones
  def index
    @applied_numbers = 
  end
  def get_applied_numbers
    # will return the applied numbers for a mapping
    @applied_numbers = Mapping.find(params[:mapping_id]).phone_numbers

    sleep 1 #development only, simulates wait time
    respond_to do |format|
      format.html { redirect_to root_path } #for my controller, i wanted it to be JS only
      format.js
    end
  end
end
