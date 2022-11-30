# AutomateAbyss - TrelloClone.

Simple Trello clone because we have nothing to do and it looks kinda interesting.

## Table of contents

- [Overview](#overview)
  - [Why?](#why)
  - [Screenshot](#screenshot)
  - [Links](#links)
- [My process](#my-process)
  - [Built with](#built-with)
  - [What we learned](#what-we-learned)
  - [In plans](#in-plans)
  - [Useful resources](#useful-resources)
- [Authors](#authors)

## Overview

### Why?

For fun.

### Screenshot

![](./screenshot.jpg)

### Links

- Hey, it's not done yet: [Will be here :)](https://github.com/AutomateAbyss/TrelloClone)

## My process

### Built with

- Rust: [Actix](https://actix.rs/) backend and [Yew](https://yew.rs/) frontend;
- [PostgreSQL](https://www.postgresql.org/);
- [Stylist](https://github.com/futursolo/stylist-rs);
- [Diesel](https://diesel.rs/) or [SeaORM](https://www.sea-ql.org/SeaORM/docs/index/);
- Hosting for DB: [Render](https://render.com/);
- Hosting for app: Unknown;

### What we learned

Nothing for now.

### In plans

Add entities in Database:

- [ ] card entity: id, name, date (opt.), description (opt.); fk - comments, labels, members, attachments;
- [ ] workspace entity: id, name; fk - boards, *users, visibilities; 
- [ ] board entity: id, name, default view (opt.); fk - lists, *users, visibilities;
- [ ] list entity: id, name, position; fk - cards;
- [ ] visibility entity: id, name, description (opt.).

- [ ] user entity: blah-blah. (*starred boards)
- [ ] comment entity: blah-blah.

- [ ] пятая нога собаки: templates.

### Useful resources

Yeah.. Empty. :(

## Authors

- [Faumaray, github](https://github.com/Faumaray)
- [Kami, github](https://github.com/kam1xgod)
- [Faumaray, telegram](https://t.me/Faumaray)
- [Kami, telegram](https://t.me/kam1xgod)
