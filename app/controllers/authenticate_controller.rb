class AuthenticateController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update create new delete]
end
