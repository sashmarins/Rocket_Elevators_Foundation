class AddressController < ApplicationController
    respond_to :json, :html
    def search
        @address_all = Address.all
        respond_with(@address_all)
    end
end
