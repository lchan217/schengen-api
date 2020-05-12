trip1 = Trip.create(location: "Germany", entry: "2017-02-20", exit: "2017-02-28", user_id: 1, passed: 1, time_passed: 8)
trip2 = Trip.create(location: "France", entry: "2020-05-11", exit: "2020-05-25", user_id: 1, passed: 0, time_passed: 14)
trip3 = Trip.create(location: "Croatia", entry: "2022-07-11", exit: "2022-08-20", user_id: 1, passed: 0, time_passed: 40)


# date format for seed/rails c "yyyy-mm-dd"