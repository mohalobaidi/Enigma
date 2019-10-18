<!-- markdownlint-disable MD001 MD014 -->

# Enigma (Programming Competition System)

**Enigma** is an automated system to upload, compile and judge players submissions of programming problems. Currently, it's supporting Java and Python for solving problems.

## Setting up the database

We are using postgres for storing data.

### (For MacOS or Linux Users)

- First install [Homebrew](https://brew.sh/)
- Now install and configure Postgres using Homebrew

```bash
$ brew install postgres
$ brew services start postgres
$ psql -d postgres -f "/path/to/seed.sql"
```

you'll find `seed.sql` file inside the project's folder.

### (For Windows Users)

- Download EnterpriseDB installer for you version of windows.
- Run the installer and go through the setup proccess.
- Before finishing it will ask you if you want to download additional tools, uncheck the box (if you don't need it).
- Launch `SQL Shell (psql)`.

```bash
Server [localhost]: localhost <You can just click Enter>
Database [postgres]: postgres <You can just click Enter>
Port [5432]: 5432             <You can just click Enter>
Username [postgres]: postgres <You can just click Enter>
Password for user postgres:   <The password you wrote during the setup proccess>
postgres=# \i '/path/to/seed.sql'
Password for user admin: hadi
```

- you'll find `seed.sql` file inside the project's folder.
- Note that you have to use 'normal' slashes ( / ) instead of backslashes ( \\ ).

## Installing and setting up the project

- Install and Setup [Nodejs](http://nodejs.org)
- Go to the `enigma` folder in terminal and execute these commands:

```bash
$ npm install
$ npm run build
$ npm start
```

## Usage

You can see the project now at http://localhost:3000

## Things to do

- Add new languages
- Improve the new design
- Make it mobile-friendly!
- sanitize and validate players submissions
- ~~Make a proper authentication~~
- ~~Design database structure~~
- ~~Start using ESLint~~
- ~~Add form validations~~
- ~~Connect frontend with backend~~
- ~~A new design for the system~~
- ~~Create a structure for writing questions (independent from any language syntax)~~
