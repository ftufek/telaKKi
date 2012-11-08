class CoolasciiController < ApplicationController
  def index
    message = params[:body]

    response = Twilio::TwiML::Response.new do |r|
      r.Sms "#{coolascii message}" 
    end

    render text: response.text
  end


  def coolascii str
    asciitable = { 
      A: "/\\",
      B: "|3",
      C: "(",
      D: "|)",
      E: "3",
      F: "F",
      G: "(-",
      H: "|-|",
      I: "i",
      J: "1",
      K: "|<",
      L: "|_",
      M: "|\/|",
      N: "|\|",
      O: "0",
      P: "9",
      Q: "0.",
      R: "|&",
      S: "5",
      T: "-|-",
      U: "()",
      V: "\/",
      Y: "\|/",
      X: "\/",
      Z: "$"
    }
    cool = ''
    str = str.upcase
    str.split(//).each do |c|
      if asciitable[c.to_sym]
        cool += asciitable[c.to_sym] + " "
      end
    end
    return cool
  end
end
