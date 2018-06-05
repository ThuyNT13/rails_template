 User with simple authentication.

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
