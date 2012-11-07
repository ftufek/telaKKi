class DifftimeController < ApplicationController
  def index
    from = params[:from]
    message = params[:body]

    res = Geokit::Geocoders::GoogleGeocoder.geocode(message)
    timezone = Timezone::Zone.new(:latlon => [res.lat, res.lng])

    response = Twilio::TwiML::Response.new do |r|
      r.Sms "#{timezone.time Time.now}" 
    end

    render text: response.text
  end
end
