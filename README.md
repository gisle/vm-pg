# PostgreSQL development server

To get going, just install [VirutalBox](http://virtualbox.org) and
[Vagrant](http://vagrantup.com), clone this repository and run:

    vagrant up

You will have the [Postgres database](http://postgresql.org) running under
[Ubuntu](http://releases.ubuntu.com/precise/) at the default port. You will
also find a management interface for the database at <http://localhost:8080>.
This database is configured for speed and might loose data if the server is
killed. It's only meant to be used for testing and development.

The _user1_ account (with password 'pass1') is set up.  This user is allowed to
create and drop databases.  Connect to the server with:

    psql -h localhost postgres user1

To log in as the postgres superuser you need to log into the virtual machine
first and then run psql from the _postgres_ user account:

    vagrant ssh
    sudo su - postgres
    psql
