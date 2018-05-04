# README

* Envirement
```
ruby 2.5.0 (recomended)
rails 5.1.4 (recomented)
sqlite3
```


* Initialization
```
bundle install
rake db:create
rake db:migrate
rake db:seed
```

* Seeds (duplicate from ../db/seeds.rb)
```
Country.create name: 'USA'
Country.create name: 'France'
Country.create name: 'Belarus'

Airport.create name: 'Airport1', city: 'USACity1', country_id: Country.find_by_name('USA').id
Airport.create name: 'Airport2', city: 'USACity2', country_id: Country.find_by_name('USA').id
Airport.create name: 'Airport3', city: 'FranceCity1', country_id: Country.find_by_name('France').id

Plane.create name: 'Plane1', seats: 120
Plane.create name: 'Plane2', seats: 120
Plane.create name: 'Plane3', seats: 80

User.create first_name: 'Test1', last_name: 'Test1', phone: '111-111-111', email: 'test1@mail.com'
User.create first_name: 'Test2', last_name: 'Test2', phone: '222-222-222', email: 'test2@mail.com'
User.create first_name: 'Test3', last_name: 'Test3', phone: '333-333-333', email: 'test3@mail.com'

Trip.create cost: 100, time_out: (Time.now + 1.days), time_in: (Time.now + 1.days + 5.hours), plane_id: Plane.find_by_name('Plane1').id, airport_from_id: Airport.find_by_name('Airport1').id, airport_to_id: Airport.find_by_name('Airport2').id
Trip.create cost: 320.44, time_out: Time.now + 3.days, time_in: Time.now + 3.days + 8.hours, plane_id: Plane.find_by_name('Plane2').id, airport_from_id: Airport.find_by_name('Airport2').id, airport_to_id: Airport.find_by_name('Airport3').id
Trip.create cost: 120.50, time_out: Time.now + 5.days, time_in: Time.now + 5.days + 2.hours, plane_id: Plane.find_by_name('Plane3').id, airport_from_id: Airport.find_by_name('Airport1').id, airport_to_id: Airport.find_by_name('Airport3').id

Trip.find(1).users << User.find_by_first_name('Test1')
Trip.find(1).users << User.find_by_first_name('Test2')
Trip.find(2).users << User.find_by_first_name('Test2')
Trip.find(2).users << User.find_by_first_name('Test3')
Trip.find(3).users << User.find_by_first_name('Test1')
Trip.find(3).users << User.find_by_first_name('Test2')
Trip.find(3).users << User.find_by_first_name('Test3')
```
* Busines logic
```
Get lower price trip from A to B airports
index_index GET    /index/index(.:format)             index#index
-- params[:trip].permit(:airport_from_id, :airport_to_id)

Other busines logic show information on Client side in table:
 - Airports: 
 -- Model have logic for get country name (func get_country_name)
 -- Model have logic for get city (func info)
 --- Validation:
 ---- validates_presence_of :name
 ---- validates_presence_of :city
 ---- validates_presence_of :country_id
 ---- validates_length_of :name, maximum: 50
 ---- validates_length_of :city, maximum: 50


 - Countries: 
 -- Contain column with Airports for this country (func airport_info)
 --- Validation:
 ---- validates_presence_of :name
 ---- validates_length_of :name, maximum: 50

 - Planes: 
 -- Contain column with free seats for Plane (func free_seats)
 -- Model have logic for normalize name (func normalize_name)

 - Trips:
 -- Contain column with Users for seat (func get_trip_users)
 -- Contain column with value of time of flight (func time_of_flight)
 -- Contain finction for get name (func plane_name)
 -- Contain finction for get airport_from name (func airport_from_name)
 -- Contain finction for get airport_to name (func airport_to_name)
 -- Contain finction for get name (func plane_name)

 - Users:
 -- Contain function to get full name in string format (func full_name)
 -- Contain finction for normalize fisrt name (func normalize_fisrt_name)
 -- Contain finction for normalize last name (func normalize_last_name)
 -- Contain finction for normalize email (func normalize_email)
 
 --- Validation: 
 ---- validates :first_name,
            :last_name,
            presence: true
 ---- validates_format_of :email, with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i
 ---- validates :email, uniqueness: { case_sensitive: false }

```

* Routes
```
            Prefix Verb   URI Pattern                        Controller#Action
              root GET    /                                  index#index
       index_index GET    /index/index(.:format)             index#index
                   POST   /index/index(.:format)             index#index
    plane_airports GET    /plane_airports(.:format)          plane_airports#index
                   POST   /plane_airports(.:format)          plane_airports#create
 new_plane_airport GET    /plane_airports/new(.:format)      plane_airports#new
edit_plane_airport GET    /plane_airports/:id/edit(.:format) plane_airports#edit
     plane_airport GET    /plane_airports/:id(.:format)      plane_airports#show
                   PATCH  /plane_airports/:id(.:format)      plane_airports#update
                   PUT    /plane_airports/:id(.:format)      plane_airports#update
                   DELETE /plane_airports/:id(.:format)      plane_airports#destroy
        user_trips GET    /user_trips(.:format)              user_trips#index
                   POST   /user_trips(.:format)              user_trips#create
     new_user_trip GET    /user_trips/new(.:format)          user_trips#new
    edit_user_trip GET    /user_trips/:id/edit(.:format)     user_trips#edit
         user_trip GET    /user_trips/:id(.:format)          user_trips#show
                   PATCH  /user_trips/:id(.:format)          user_trips#update
                   PUT    /user_trips/:id(.:format)          user_trips#update
                   DELETE /user_trips/:id(.:format)          user_trips#destroy
             trips GET    /trips(.:format)                   trips#index
                   POST   /trips(.:format)                   trips#create
          new_trip GET    /trips/new(.:format)               trips#new
         edit_trip GET    /trips/:id/edit(.:format)          trips#edit
              trip GET    /trips/:id(.:format)               trips#show
                   PATCH  /trips/:id(.:format)               trips#update
                   PUT    /trips/:id(.:format)               trips#update
                   DELETE /trips/:id(.:format)               trips#destroy
            planes GET    /planes(.:format)                  planes#index
                   POST   /planes(.:format)                  planes#create
         new_plane GET    /planes/new(.:format)              planes#new
        edit_plane GET    /planes/:id/edit(.:format)         planes#edit
             plane GET    /planes/:id(.:format)              planes#show
                   PATCH  /planes/:id(.:format)              planes#update
                   PUT    /planes/:id(.:format)              planes#update
                   DELETE /planes/:id(.:format)              planes#destroy
          airports GET    /airports(.:format)                airports#index
                   POST   /airports(.:format)                airports#create
       new_airport GET    /airports/new(.:format)            airports#new
      edit_airport GET    /airports/:id/edit(.:format)       airports#edit
           airport GET    /airports/:id(.:format)            airports#show
                   PATCH  /airports/:id(.:format)            airports#update
                   PUT    /airports/:id(.:format)            airports#update
                   DELETE /airports/:id(.:format)            airports#destroy
         countries GET    /countries(.:format)               countries#index
                   POST   /countries(.:format)               countries#create
       new_country GET    /countries/new(.:format)           countries#new
      edit_country GET    /countries/:id/edit(.:format)      countries#edit
           country GET    /countries/:id(.:format)           countries#show
                   PATCH  /countries/:id(.:format)           countries#update
                   PUT    /countries/:id(.:format)           countries#update
                   DELETE /countries/:id(.:format)           countries#destroy
             users GET    /users(.:format)                   users#index
                   POST   /users(.:format)                   users#create
          new_user GET    /users/new(.:format)               users#new
         edit_user GET    /users/:id/edit(.:format)          users#edit
              user GET    /users/:id(.:format)               users#show
                   PATCH  /users/:id(.:format)               users#update
                   PUT    /users/:id(.:format)               users#update
                   DELETE /users/:id(.:format)               users#destroy
```