class Users::ContactFilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @pagy, @contact_files = pagy(current_user.contact_files)
  end

  def new
    @contact_file = current_user.contact_files.new
  end

  def create
    @contact_file = current_user.contact_files.new(contact_file_params)

    if @contact_file.save
      redirect_to users_contact_files_path, notice: "The file was uploaded successfully"
    else
      redirect_to new_users_contact_file_path, alert: "Ups, something wrong. Try again."
    end
  end

  def contact_file_params
    file = params[:contact_file][:contacts_file]
    {
      filename: file.original_filename,
      content: file.read,
      match_columns: params[:contact_file][:match_columns].as_json
    }
  end
end
