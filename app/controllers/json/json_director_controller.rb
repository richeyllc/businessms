class Json::JsonDirectorController < ApplicationController
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
