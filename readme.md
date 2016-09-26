Standard SaaS Application
======

# Whats done
1. Generated New Rails App
2. Setup Gemfile for Test Suite
3. Configured RSpec, Shoulda, Capybara etc...
4. Integration tests for Account Creation
5. Account Model Specs with Subdomain Validations
6. Integration tests for User Authentication
7. Integration tests for Subdomain Bifurcation
8. Configured Apartment for Multitenancy
9. Accounts with Schemas
10. Accounts with Subdomains
11. Subdomains routing configurations
12. Cloudflare for Subdomains

# What needs to be done

# Configurations

1. For Production, you need to grant your postgres user privileges to create schemas on the fly

```
postgres=# GRANT CREATE ON DATABASE db_name TO db_user;
```
2. For live subdomain usage, add Cloudflare API keys and details to secrets.yml
3. PostgreSQL is mandatory
4. For Development, use POW server or lvh.me:3000
___
Aim: Learning RSpec and Testing on Rails

Aniket Rao
