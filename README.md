 User with simple authentication.

 ## Setting up

```bash
rails new <app_name> -d=postgresql
```

```bash
rails g controller Pages home
```

```bash
rails g controller Users index show new edit
```
```bash
rails g model User username:string email:string password_digest:string
```

```bash
rails g controller Sessions new
```

## Bcrypt authentication

Add Bcrypt to [gemfile](Gemfile).

Include `has_secure_password` *method* in [User model](app/models/user.rb) to enable password hashing and the **authenticate** method, which returns false if password is incorrect, and the user if correct.

Remember to set **password** to `password_digest` attribute when [creating the model](db/migrate/20180603101550_create_users.rb) for table migration. `has_secure_password` enforces validations on **password**, however, so use **password** as attribute in [User model](app/models/user.rb).

## Testing

Utilizing [**MiniTest**](http://guides.rubyonrails.org/testing.html).

Gathering together all the unit and integration tests that are needed for ensuring code won't break with changes.

## issue

errors:

```bash
Error:
UsersEditTest#test_successful_edit:
ActionController::UrlGenerationError: No route matches {:action=>"edit", :controller=>"users", :id=>nil}, missing required keys: [:id]
    test/integration/users_edit_test.rb:13:in `block in <class:UsersEditTest>'
```

```ruby
# test/integration/users_edit_test.rb:13
get edit_user_path(@suser)
```

## Do

[Remember me checkbox](https://www.railstutorial.org/book/advanced_login#sec-remember_me_checkbox)

[Pagination](https://www.railstutorial.org/book/updating_and_deleting_users#sec-pagination)
