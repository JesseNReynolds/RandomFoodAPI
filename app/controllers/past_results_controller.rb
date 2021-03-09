class PastResultsController < ApplicationController

  # GET /past_results
  def index
    @past_results = PastResult.all

    render json: @past_results
  end


  # POST /past_results
  def create
    @past_result = PastResult.new(past_result_params)

    @past_result[:user_id] = user_id_from_fb_id(@past_result[:user_id])
    
    if @past_result.save
      render json: @past_result, status: :created, location: @past_result
    else
      render json: @past_result.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def past_result_params
      params.require(:past_result).permit(:user_id, :yelp_id, :rating, :restaurant_name)
    end
end
