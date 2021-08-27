puts "Cargando el seed de Development"

user = User.new(
    :first_name              => "123456",
    :last_name              => "123456",
    :username              => "Creyes",
    :email                 => "carlos_mlb_reyes@hotmail.com",
    :password              => "123456",
    :password_confirmation => "123456",
    :privilege              => "Super Administrador"
)

user.save!