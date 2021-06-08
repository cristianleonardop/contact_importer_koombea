class Users::ContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pagy, @contacts = pagy(current_user.contacts.decorate)
  end
end
