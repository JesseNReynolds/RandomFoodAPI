class YelpQueryController < ApplicationController

    def new
        @query = YelpQuery.new(latitude: params[:latitude], longitude: params[:longitude], radius: params[:radius], open_boolean: params[:openBool])
        @query.compile_results
        render json: @query.results
    end

end