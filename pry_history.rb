ls
exit
params
params["controller"]
params[:controller]
ls
params
exit
Datetime
exit
DateTime
DateTime.new
DateTime.new(2015, 5, 10)
exit
Booking
Booking.all
Booking.create(customer_name: "Robby Dore")
exit
whereami
params
params["bookin"]
params["booking"]
params.require("booking")
params.require("booking").permit("customer_name")
exit
bookings
bookings(:moose)
Booking.where(customer_name: "Moose Osborne").first
exit!
booings(:poo_poo_head)
bookings(:poo_poo_head)
bookings(:poo_poo_head)exit
exit
b = Booking.new
b.save
b
b.errors
ls b.errors
ls b.errors.full_message
ls b.errors.full_messages
b.errors.full_messages
b.errors.first
exit
BCrypt::Password
BCrypt::Password.new "lajlaksjdf"
BCrypt::Password.create "coffee"
a = _
a.class
ls a
a == "password"
a == "coffee"
a
a == "coffee"
a.checksum
a
a.cost
a.salt
params
params.keys
params[:email]
User.where(email: params[:email])
User.find_by(email: params[:email])
params[:password]
current_user = User.find_by(email: params[:email])
current_user
ls current_user
ls current_user.password
current_user.password
current_user.password.class
current_user.password == "coffee"
current_user.password == params[:password]
exit
