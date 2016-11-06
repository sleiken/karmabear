class Api::ApiController < ApplicationController
  respond_to :json

  def show
    respond_with JSON.pretty_generate(JSON.parse(Charity.all.to_json))
  end
end
