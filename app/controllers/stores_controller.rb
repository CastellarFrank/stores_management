class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy, :messages]
  helper_method :formatted_message_date

  def index
    @stores = Store.all.order('name ASC')
  end

  def edit
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)

    if @store.save
      flash[:notice] = "A new store with store number: [#{@store.name}] was successfully created."
      redirect_to :controller => 'stores', :action => 'show', :id => @store.id
    else
      render :new
    end
  end

  def destroy
    @store.destroy
    redirect_to stores_path, notice: "Store with store number: [#{@store.name}] has been successfully deleted."
  end

  def update
    if @store.update(store_params)
      flash[:notice] = "Store with store number: [#{@store.name}] was successfully updated."
      redirect_to :controller => 'stores', :action => 'show', :id => @store.id
    else
      render :edit
    end
  end

  def show
  end

  def messages
    @contacts = @store.contacts
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    def store_params
      params.require(:store).permit!
    end

    def formatted_message_date(date)
      date.strftime('%d/%m/%Y - %I:%M:%S')
    end
end
