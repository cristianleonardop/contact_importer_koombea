require 'csv'

class ContactFileImporterService
  def initialize(contact_file)
    @contact_file = contact_file
    @contact_file.start_process!
  end

  def import_contact_file_data
    content = @contact_file.content
    @contact_file.finish_process! if content.blank?

    csv = content.gsub(file_headers, new_headers)
    user = @contact_file.user

    CSV.parse(csv, headers: true).each do |row|
      contact = user.contacts.new(row.to_h)

      unless user.save
        user.contact_logs.create(contact_details: contact.attributes, errors_details: contact.errors.messages)
      end
    end
  rescue StandardError => e
    @contact_file.fail_process!
  end

  def file_headers
    @contact_file.content.split("\r\n")[0]
  end

  def new_headers
    new_headers = file_headers
    @contact_file.match_columns.each do |k, v|
      new_headers.gsub!(v, k)
    end

    new_headers
  end
end
