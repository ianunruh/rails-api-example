class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  rescue_from ActiveRecord::RecordInvalid do |e|
    render status: :unprocessable_entity, json: {
      error: 'invalid_resource',
      error_description: 'There were errors when validating this resource',
      messages: e.record.errors.to_hash
    }
  end

  rescue_from ActiveRecord::RecordNotUnique do
    render status: :conflict, json: {
      error: 'conflict',
      error_description: 'The request conflicted with an existing resource'
    }
  end

  private

  def render_not_implemented
    render status: :not_implemented, json: {
      error: 'not_implemented',
      error_description: 'This resource or action has not been implemented yet'
    }
  end

  def render_not_found
    render status: :not_found, json: {
      error: 'not_found',
      error_description: 'This resource could not be found'
    }
  end

  def render_no_content
    render status: :no_content, nothing: true
  end
end
