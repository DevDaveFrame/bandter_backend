class Api::V1::UserInstrumentsController < ApplicationController
  def create
    user_instruments = []
    params[:user_instrument][:instruments].each do |instrument|
      user_instruments.push(UserInstrument.create(user_id: params[:user_instrument][:user_id], instrument_id: instrument))
    end
    instruments = user_instruments.map{|ui| Instrument.find(ui.instrument_id)}
    render json: instruments
  end
end
