class WelcomeController < ApplicationController
  def index
    render json: {
        status: 200,
        message: "Welcome to the BikeBoard API",
        version: "1.0",
        creator: "Jared Long"
    }
  end
end

