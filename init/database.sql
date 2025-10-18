# Script MySQL

CREATE DATABASE IF NOT EXISTS `eventplannerdb`;
USE `eventplannerdb`;

CREATE TABLE IF NOT EXISTS `role`{
    `id_role` Int Auto_increment NOT NULL,
    `name` Varchar (20) NOT NULL,
    CONSTRAINT `role_pk` PRIMARY KEY (`id_role`)
}

CREATE TABLE IF NOT EXISTS `user`{
    `id_user` Int Auto_increment NOT NULL,
    `pseudo`  Varchar (50) NOT NULL,
    `password` Varchar(255) NOT NULL,
    `email` Varchar (255) NOT NULL,
    `creation_date` Date NOT NULL,
    `id_role` Int NOT NULL,
    CONSTRAINT `user_pk` PRIMARY KEY (`id_user`),
    CONSTRAINT `user_role_FK` FOREIGN KEY ('id_role') REFERENCES role(id_role)

};

CREATE TABLE IF NOT EXISTS `event`{
    `id_event` Int Auto_increment NOT NULL,
    `title` Varchar (150) NOT NULL,
    `description` Text NOT NULL,
    `image` Varchar (255) ,
    `creation_date` Date NOT NULL,
    `modification_date` Date ,
    CONSTRAINT `event_pk` PRIMARY KEY (`id_event`),
}

CREATE TABLE IF NOT EXISTS `comment`{
    `id_comment` Int Auto_increment NOT NULL,
    `title` Varchar (150) NOT NULL,
    `description` Text NOT NULL,
    `image` Varchar (255) ,
    `creation_date` Date NOT NULL,
    `modification_date` Date ,
    `id_user` Int NOT NULL,
    `id_event` Int NOT NULL,
    CONSTRAINT `comment_pk` PRIMARY KEY (`id_comment`),
    CONSTRAINT `comment_event_FK` FOREIGN KEY (`id_event`) REFERENCES event(id_event),
    CONSTRAINT `user_comment_FK` FOREIGN KEY (`id_user`) REFERENCES user(id_user)
}