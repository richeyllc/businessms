module Json
  class PhoneNumbersController < JsonDirectorController
    #phone numbers controller
    before_action :set_mapping
    # load_and_authorize_resource :mapping
    # load_and_authorize_resource :phone_numbers, through: :mapped_phones

    respond_to :js
    def index
      # will return the applied numbers for a mapping
      @applied_numbers = MappedPhone.where(mapping: @mapping)

      sleep 1 #development only, simulates wait time
      respond_to do |format|
        format.html { redirect_to root_path } #for my controller, i wanted it to be JS only
        format.js
      end
    end

    private
    def set_mapping
      # This will set the mapping to the correct instance. 
      @mapping = Mapping.find(params[:mapping_id])
    end
  end
end