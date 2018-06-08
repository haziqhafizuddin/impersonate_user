module Api
  class ApiController < ApplicationController
    include Knock::Authenticable
    include Api::Concerns::Response
    include Api::Concerns::ExceptionHandler
  end
end
