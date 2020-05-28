# Rota Manager API
This is a simple API in Ruby on Rails to get rota data.

## To execute

In terminal execute:

```sh
$ rails s
```

## To create the database

In terminal execute:

```sh
$ rake db:create db:migrate db:seed
```

## To run the tests

In terminal execute:

```sh
$ rspec
```

## Endpoints

### GET all shifts

Get all shifts.

```
http://localhost:3000/shifts
```

It is possible to filter the shifts by job type and start time period:
```
?jobType=Barista
?period=am
?jobType=Barista&period=am
```

### GET all invited contracts

Get all invited contracts.

```
http://localhost:3000/invited contracts
```

It is possible to filter the invited contracts by role id:
```
?roleId=2
```
