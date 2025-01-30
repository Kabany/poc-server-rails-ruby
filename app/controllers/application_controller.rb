class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :SuccessResponse

  def SuccessResponse(data, message=nil)
    @data = {success: true}
    if data != nil
      @data["data"] = data
    end
    if message != nil
      @data["message"] = message
    end
    return @data
  end
end
