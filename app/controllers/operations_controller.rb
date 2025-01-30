class OperationsController < ApplicationController
  include OperationsHelper
  protect_from_forgery with: :null_session

  def send_list_from_params
    @times = Integer(params[:times])
    @list = create_list(@times)
    render json: SuccessResponse(@list)
  end

  def send_list_from_query
    @params = CGI.parse(request.query_string)
    @times = Integer(@params["times"][0])
    @list = create_list(@times)
    render json: SuccessResponse(@list)
  end

  def send_list_from_body
    @times = params[:times]
    @list = create_list(@times)
    render json: SuccessResponse(@list)
  end

  def send_list_from_headers
    @times = Integer(request.headers["times"])
    @list = create_list(@times)
    render json: SuccessResponse(@list)
  end

  ## Fibonacci

  def send_fibonacci_sum
    @num = Integer(params[:number])
    @sum = fibonacci_sum(@num)
    render json: SuccessResponse(@sum)
  end

  def send_fibonacci_list
    @num = Integer(params[:number])
    @sum = fibonacci_list(@num)
    render json: SuccessResponse(@sum)
  end
end