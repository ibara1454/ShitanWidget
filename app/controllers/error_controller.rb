class ErrorController < ApplicationController
  # routing not found error 対策
  def notfound
    redirect_to :root
  end
end
