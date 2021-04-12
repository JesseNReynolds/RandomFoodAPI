class PastResultsController < ApplicationController

  # GET /past_results
  def index
    if params[:user_id]
      @past_results = User.find(user_id_from_fb_id(params[:user_id])).PastResults
      render json: @past_results
    end
  end


  # POST /past_results
  def create
   
    config_obj = {}
    config_obj[:user_id] = user_id_from_fb_id(past_result_params[:user_id])
    config_obj[:yelp_id] = past_result_params[:yelp_id]
    config_obj[:restaurant_name] = past_result_params[:restaurant_name]
    
    @past_result = PastResult.new(config_obj)
    
    if @past_result.save
      render json: {status: 202}
    else
      render json: @past_result.errors, status: :unprocessable_entity
    end

  end

  def update

    @past_result = PastResult.find(params[:id])

    @past_results = User.find(@past_result.user_id).PastResults

    if @past_result.update(past_result_params)
      render json: @past_results
    end

  end

  def show

    @past_result = PastResult.find(params[:id])

    business_info = @past_result.get_business_info

    if business_info
      render json: business_info
    end

  end

  def destroy

    @past_result = PastResult.find(params[:id])

    @past_results = User.find(@past_result.user_id).PastResults

    if @past_result.destroy
      render json: @past_results
    end

  end

  private
    # Only allow a list of trusted parameters through.
    def past_result_params
      params.require(:past_result).permit(:user_id, :yelp_id, :rating, :restaurant_name)
    end
end
