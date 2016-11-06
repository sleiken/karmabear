class Api::ApiController < ApplicationController
  respond_to :json

  def show
    respond_with Charity.all.to_json
  end
end
