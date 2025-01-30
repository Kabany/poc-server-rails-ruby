class OperationsController < ApplicationController

  def send_list_from_body
    @times = request.body.times
    @list = create_list(@times)
    render json: SuccessResponse(@list)
  end
end