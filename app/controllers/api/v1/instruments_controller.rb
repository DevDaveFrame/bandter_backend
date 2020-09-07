class Api::V1::InstrumentsController < ApplicationController
  skip_before_action :logged_in?, only: [:index, :update]
  def index
    instruments = Instrument.all
    render json: instruments, only: [:id, :name]
  end
end
