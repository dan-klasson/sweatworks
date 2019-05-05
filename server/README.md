## Installation

### Database Setup

Uses postgres. See [database.yml](config/database.yml) for details.
**Note:** DB credentials only added for install simplicity. They would normally never go in the repo.

### Create Database & Seed it

    rails db:setup db:migrate db:seed

### Start server

     rails s

### Run the Tests

    rails spec
