puts "Cargando el seed de Development"

user = User.create_with(
    :first_name              => "Carlos",
    :last_name              => "Reyes",
    :username              => "Creyes",
    :password              => "123456",
    :password_confirmation => "123456",
    :privilege              => "Administrador"
).find_or_create_by(
    :email                 => "carlos_mlb_reyes@hotmail.com",
)

user = User.create_with(
    :first_name              => "Cristiano",
    :last_name              => "Ronaldo",
    :username              => "Cr7",
    :password              => "123456",
    :password_confirmation => "123456",
    :privilege              => "Manager"
).find_or_create_by(
    :email                 => "cr7@hotmail.com",
)

user = User.create_with(
    :first_name              => "Hugo",
    :last_name              => "Pérez",
    :username              => "Hperez",
    :password              => "123456",
    :password_confirmation => "123456",
    :privilege              => "Operador"
).find_or_create_by(
    :email                 => "hperez@hotmail.com",
)

array_states = ['En pausa', 'En progreso', 'Cancelado']
array_phases = ['Planificación', 'Implementación', 'Testing', 'Prototipado']

5.times{
    project = Project.create(
        name: Faker::Company.industry, 
        description: Faker::Lorem.sentence, 
        state: array_states.sample,
        start_date: Faker::Date.between(from: '2021-08-31', to: '2021-09-30'), 
        end_date: Faker::Date.between(from: '2021-10-01', to: '2022-12-31'), 
        users_id: Faker::Number.between(from: 1, to: 3)
    )
}

18.times{
    phase = Project::Phase.create(
        name: array_phases.sample, 
        description: Faker::Lorem.sentence, 
        start_date: Faker::Date.between(from: '2021-08-31', to: '2021-09-30'), 
        end_date: Faker::Date.between(from: '2021-10-01', to: '2022-12-31'), 
        projects_id: Faker::Number.between(from: 1, to: 5)
    )
}

50.times{
    activity = Project::Phase::Activity.create(
        name: Faker::Hobby.activity, 
        description: Faker::Lorem.sentence, 
        start_date: Faker::Date.between(from: '2021-08-31', to: '2021-09-30'), 
        end_date: Faker::Date.between(from: '2021-10-01', to: '2022-12-31'), 
        project_phases_id: Faker::Number.between(from: 1, to: 18)
    )
}

50.times{
    milestone = Project::Phase::Milestone.create(
        name: Faker::Hobby.activity, 
        description: Faker::Lorem.sentence, 
        project_phases_id: Faker::Number.between(from: 1, to: 18)
    )
}

50.times{
    note = Project::Phase::Milestone::Note.create(
        note: Faker::Lorem.sentence, 
        project_phase_milestones_id: Faker::Number.between(from: 1, to: 50), 
        users_id: Faker::Number.between(from: 1, to: 3)
    )
}


