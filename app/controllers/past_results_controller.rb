class PastResultsController < ApplicationController
  before_action :set_past_result, only: [:show, :update, :destroy]

  # GET /past_results
  def index
    @past_results = PastResult.all

    render json: @past_results
  end

  # GET /past_results/1
  def show
    render json: @past_result
  end

  # POST /past_results
  def create
    @past_result = PastResult.new(past_result_params)

    if @past_result.save
      render json: @past_result, status: :created, location: @past_result
    else
      render json: @past_result.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /past_results/1
  def update
    if @past_result.update(past_result_params)
      render json: @past_result
    else
      render json: @past_result.errors, status: :unprocessable_entity
    end
  end

  # DELETE /past_results/1
  def destroy
    @past_result.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_past_result
      @past_result = PastResult.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def past_result_params
      params.require(:past_result).permit(:user_id, :yelp_id, :rating, :restaurant_name)
    end
end
