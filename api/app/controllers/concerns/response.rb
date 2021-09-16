module Response
  extend ActiveSupport::Concern

  def json_response(object, status = :ok, error_message = nil, number_of_pages = nil, options = nil)
    object ||= {}
    if object.is_a?(Hash) && object[:data].present?
      object = object.merge(page: page.to_i, per_page: per_page.to_i)
      object = object.merge(number_of_pages: number_of_pages) if number_of_pages
    end
    object = object.merge(json_errors(error_message)) if error_message.present?
    object = object.merge(options) if options.present?

    render json: object.to_json, status: status
  end

  private

  def json_errors(message)
    return { errors: message } if message.is_a? Array
    
    { errors: [message] }
  end
end