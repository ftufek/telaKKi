class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [ :profile ]

  def profile
  end

end
