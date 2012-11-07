class DifftimeController < ApplicationController
  def index
    from = params[:from]
    message = params[:body]

    response = Twilio::TwiML::Response.new do |r|
      r.Sms "test!" 
    end

    render text: response.text
  end
end
