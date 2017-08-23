class AuthenticateController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :create, :new, :delete]
end
