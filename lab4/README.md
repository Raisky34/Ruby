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