class Manager::NeedsController < Manager::ApplicationController
  before_action :charity
  before_action :need, only: [:show, :edit, :update, :destroy]

  def index
    @needs = @charity.needs
  end

  def show
    @givers = @need.givers
  end

  def new
    @need = Need.new
  end

  def create
    @need = @charity.needs.new(need_params)

    if @need.save
      redirect_to manager_charity_path(@charity)
    else
      @errors = @need.errors.full_messages
      render "manager/needs#show"
    end
  end

  def edit
  end

  def update
    if @need.update(need_params)
      redirect_to manager_charity_need_url(@charity, @need)
    else
      @errors = @need.errors.full_messages
      render "manager/needs#edit"
    end
  end

  def destroy
    @need.destroy

    redirect_to manager_charity_needs_url(@charity)
  end

  private

  def need_params
    params.require(:need).permit(:name, :description, :quantity_needed, :status)
  end

  def charity
    @charity ||= Charity.find(params[:charity_id])
  end

  def need
    @need ||= Need.find(params[:id])
  end
end
