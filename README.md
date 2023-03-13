![](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![](https://img.shields.io/badge/MySQL-00000F?style=for-the-badge&logo=mysql&logoColor=white)

![GitHub contributors](https://img.shields.io/github/contributors/melohan/GradeBook?style=flat-square)
![GitHub issues](https://img.shields.io/github/issues/melohan/GradeBook?style=flat-square)
![GitHub](https://img.shields.io/github/license/melohan/GradeBook?style=flat-square)

# GradeBook

The aim of this project is to provide a web-based application that allows teachers to assign grades to students in their classes and to allow these students to consult their report cards.

## Setting up dev

### Prerequisites

- Rails 7.0.4.2
- Ruby 3.0.4
- MariaDB 10.6.12

### Clone the repository

```shell
git clone git@github.com:melohan/GradeBook.git
cd GradeBook
git switch develop
```

### Configurations

1. Copy and rename `/GradeBook/config/example.database.yml` to `/GradeBook/config/database.yml`
2. Set your databases, database user and password.

### Run the project

1. Go to the RoR project directory and install dependencies
```shell
cd GradeBook
bundle install
```
2 . Run the project
```shell
bin/rails server
```

### Database migration

These instruction allow to drop, create and create tables as defined in `./db/migrate/*`

```shell
rails db:drop
rails db:create
rails db:migrate
```

## Branches strategy

Refer to the workflow [GitFlow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow).

GitFlow installation:
- [Windows](https://git-scm.com/download/win)
- [Linux/Ubuntu](https://howtoinstall.co/en/git-flow)

Main branches description:

| Branches  | Description |
|---|---|
| main/ | stores the official release history  |
| develop/ | serves as an integration branch for features |
| feature/| fork of `develop/` for a new feature|
|release/|fork of `develop/`, once the release is ready, it should be merge to `main`|

## Contributing

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement". Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (git checkout -b feature/amazing_feature)
3. Commit your Changes (git commit -m 'Add some amazing_feature')
4. Push to the Branch (git push origin feature/amazing_feature)
5. Open a Pull Request

## Licence

Distributed under the MIT License. See LICENSE for more information.
