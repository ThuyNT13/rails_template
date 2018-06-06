 User with simple authentication with all the unit and integration tests that are needed for ensuring code won't break with changes. Probably refactor a few of the tests to DRY them up.

 ## Setting up

```bash
rails new rails_template -d=postgresql
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

Need to review these tests for now to see why they are failing:

* [users_edit_test.rb](test/integration/users_edit_test.rb)
* [users_controller_test.rb](test/controllers/users_controller_test.rb)


## Support

Please open [an issue](https://github.com/ThuyNT13/rails_template/issues) for support.

## Contributing

Please contribute using [Github Flow](https://guides.github.com/introduction/flow/). Create a branch, add commits, and open a [pull request](https://github.com/ThuyNT13/rails_template/pulls).
