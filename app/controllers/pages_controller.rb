class PagesController < ApplicationController

  def soon 
    render layout: false
  end

  def intro
    render layout: false
  end

  def prelauncher
    @prelaunch = Prelaunch.new(params[:prelauncher])

    if @prelaunch.save
      render json: { status: 'succeded' }
    else
      if Prelaunch.where(email: @prelaunch.email).exists?
        render json: { status: 'already_registered' }
      else
        render json: { status: 'failed' }
      end
    end
  end

  def faq
  end

  def help
  end

  def about_us
  end

end
