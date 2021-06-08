class Users::ContactLogsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pagy, @contact_logs = pagy(current_user.contact_logs)
  end
end
