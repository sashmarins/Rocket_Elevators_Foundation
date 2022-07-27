class ColumnController < ApplicationController
    respond_to :json, :html
    def search
        @column_customer = Column.where(battery_id: params[:batselected])
        respond_with(@column_customer)
    end

end
