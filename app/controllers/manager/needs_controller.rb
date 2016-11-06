class Manager::NeedsController < ApplicationController
  # before_action :manager
  before_action :charity

  def index
    @needs = charity.needs
  end

  def new
  end

  def create
  end

  def edit
  end

  def show
    @need = Event.find(params[:id])
  end

  def update
  end

  def destroy

  end

  private

  def charity
    @charity ||= Charity.find(params[:charity_id])
  end
end
