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
    redirect_to book_reservation_path(@book, @reservation)
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

def accept
  @reservation = Reservation.find(params[:id])
  @reservation.status = "Accepted"
  @reservation.save
  redirect_to book_reservation_path(@reservation.book, @reservation)
end

def decline
  @reservation = Reservation.find(params[:id])
  @reservation.status = "Declined"
  @reservation.save
  redirect_to book_reservation_path(@reservation.book, @reservation)
end

def bookings
  
  # @book = Book.find(params[:book_id])
  # @reservation = Reservation.find(params[:id])
end

private

def reservation_strong_params
  params.require(:reservation).permit(:start_date, :end_date, :approved, :cancelled, :book_id)
end

end
