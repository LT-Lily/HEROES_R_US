class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @hero = Hero.find(params[:hero_id])
    @user = current_user
    @booking.user_id = @user.id
    @booking.hero_id = @hero.id
    @total_price = @hero.price * (@booking.end_date - @booking.start_date).to_i
    @booking.total_price = @total_price
    # raise
    @booking.save
    
    redirect_to hero_path(@hero)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :user_id, :hero_id)
  end

    

end

