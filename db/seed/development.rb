puts "Cargando el seed de Development"

user = User.create_with(
    :first_name              => "Carlos",
    :last_name              => "Reyes",
    :username              => "Creyes",
    :password              => "123456",
    :password_confirmation => "123456",
    :privilege              => "Super Administrador"
).find_or_create_by(
    :email                 => "carlos_mlb_reyes@hotmail.com",
)
