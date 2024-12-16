create table `Users` (
    `user_id` bigint primary key auto_increment,
    `username` VARCHAR(255) not null,
    `email` VARCHAR(255) not null,
    `password` VARCHAR(255) not null,
    `created_at` DATETIME not null DEFAULT CURRENT_TIMESTAMP
);
create table `Boards` (
    `board_id` bigint primary key auto_increment,
    `name` VARCHAR(255) not null,
    `description` TEXT DEFAULT null
);
create table `Posts` (
    `post_id` bigint primary key auto_increment,
    `title` VARCHAR(255) not null,
    `content` TEXT not null,
    `user_id` bigint,
    foreign key (`user_id`) references `Users` (`user_id`),
    `board_id` bigint,
    foreign key (`board_id`) references `Boards` (`board_id`),
    `created_at` DATETIME not null DEFAULT CURRENT_TIMESTAMP
);
create table `Comments` (
    `comment_id` bigint primary key auto_increment,
    `content` TEXT not null,
    `user_id` bigint,
    foreign key (`user_id`) references `Users` (`user_id`),
    `post_id` bigint,
    foreign key (`post_id`) references `Posts` (`post_id`),
    `created_at` DATETIME not null DEFAULT CURRENT_TIMESTAMP
);
create table `Tags` (
    `tag_id` bigint primary key auto_increment,
    `name` VARCHAR(255) not null
);
create table `Post_Tags` (
    `post_id` bigint,
     foreign key (`post_id`) references `Posts` (`post_id`),
    `tag_id` bigint,
    foreign key (`tag_id`) references `Tags` (`tag_id`)
);