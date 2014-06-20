class Api::StoresController < Api::ApiController
  respond_to :json

  def index
    @stores = Store.includes(:groups).order(:name)
    respond_with @stores
  end
end
