# Openjobs

<table>
  <tr>
    <td>Ruby version</td>
    <td>
      2.7.2
    </td>
  </tr>
  <tr>
    <td>Rails version</td>
    <td>
      6.1.x
    </td>
  </tr>
  <tr>
    <td>Database</td>
    <td>
      PostgreSQL
    </td>
  </tr>
</table>

## Settings to run the project

```bash
# clone the project
git clone https://github.com/danniel20/openjobs.git

# enter the cloned directory
cd openjobs

# install Ruby on Rails dependencies
bundle install --without production

# create the development and test databases
bundle exec rails db:create

# create the tables
bundle exec rails db:migrate

# run the project
bundle exec rails s
```

The backend is available at `http://localhost:3000`.

## Tests

![Tests](https://github.com/danniel20/openjobs/actions/workflows/ci.yml/badge.svg)

To run the tests:

```bash
bundle exec rspec
```
