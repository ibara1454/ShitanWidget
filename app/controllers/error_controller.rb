class ErrorController < ApplicationController
  # routing not found error 対策
  def notfound
    raise ActionController::RoutingError.new('404 Not Found')
  end
end
