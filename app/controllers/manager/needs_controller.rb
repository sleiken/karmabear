class Manager::NeedsController < Manager::ApplicationController
  before_action :find_charity
  before_action :find_need, only: [:edit, :update, :destroy]

  def index
    @needs = @charity.needs
  end

  def show
    #Display this charity from link
    @need = @charity.needs.find(params[:id])
  end

  def new
    @need = Need.new
  end

  def create
    @need = @charity.needs.new(need_params)

    if @need.save
      redirect_to manager_charity_need_path(@charity, @need)
    else
      @errors = @need.errors.full_messages
      render "manager/needs#show"
    end
  end

  def edit

  end

  def update
    @need.update(need_params)
    redirect_to manager_charity_need_url(@charity, @need)
  end

  def destroy
    @need.destroy

    redirect_to manager_charity_needs_url(@charity)
  end

  private

  def need_params
    params.require(:need).permit(:name, :description, :quantity_needed, :status)
  end

  def find_charity
    @charity = Charity.find(params[:charity_id])
  end

  def find_need
    @need = Need.find(params[:id])
  end

end
