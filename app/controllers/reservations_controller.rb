class ReservationsController < ApplicationController

def new
  @book = Book.find(params[:book_id])
  @reservation = Reservation.new
end

def create
  @reservation = Reservation.new(reservation_strong_params)
  @book = Book.find(params[:book_id])
  @reservation.book = @book
  if @reservation.save
    redirect_to book_path(@book)
    flash.notice = "Your reservation has been sent to the host."
  else
    render :new
    flash.alert = "Your reservation did not save."
  end
end

def show
  @book = Book.find(params[:book_id])
  @reservation = Reservation.find(params[:id])
end

def declined

end

def approved

end

private

def reservation_strong_params
  params.require(:reservation).permit(:start_date, :end_date, :approved, :cancelled, :book_id)
end

end
