-- ==================== DDL SCRIPTS ==========================================================================================
insert into SalaryGrade values (1, 30, 60000);
insert into SalaryGrade values (2, 40, 80000);
insert into SalaryGrade values (3, 50, 100000);
insert into SalaryGrade values (4, 60, 120000);
insert into SalaryGrade values (5, 75, 150000);



insert into Studio values ('Su01', 'Magpie', '43432541', 200, '1 Studio Rd, Sydney NSW');
insert into Studio values ('Su02', 'Raven', '23854948', 250, '2 Studio Rd, Sydney NSW');
insert into Studio values ('Su03', 'Cuckoo', '25795772', 150, '3 Studio Rd, Sydney NSW');
insert into Studio values ('Su04', 'Cockatoo', '82567273', 275, '4 Studio Rd, Sydney NSW');
insert into Studio values ('Su05', 'Sparrow', '63314842', 340, '5 Studio Rd, Sydney NSW');



insert into Staff values ('Staff001', 'Anthony A.', 'M', '1970-06-13', 'anthony.a@shine.com.au', '14637347', 'Director', NULL);
insert into Staff values ('Staff005', 'Caroline C.', 'F', '1980-06-03', 'carol.c@shine.com.au', '23842574', 'Director', 'Staff001');
insert into Staff values ('Staff009', 'Daniel D.', 'M', '1980-01-01', 'dan.d@shine.com.au', '21855940', 'Account manager', 'Staff001');
insert into Staff values ('Staff010', 'Evelyn E.', 'F', '1982-12-21', 'eve.e@shine.com.au', '27194673', 'Account manager', 'Staff005');
insert into Staff values ('Staff016', 'Helen H.', 'F', '1984-02-03', 'helen.h@shine.com.au', '84757437', 'Account manager', 'Staff005');
insert into Staff values ('Staff025', 'Lucas L.', 'M', '1990-03-22', 'luc.l@shine.com.au', '37205848', 'Technical Personnel', 'Staff009');
insert into Staff values ('Staff036', 'Pauline P.', 'F', '1992-04-05', 'pauline.p@shine.com.au', '24927457', 'Admin Personnel', 'Staff010');
insert into Staff values ('Staff049', 'Thomas T.', 'M', '1989-09-05', 'tom.t@shine.com.au', '14756933', 'Accountant', 'Staff016');
insert into Staff values ('Staff101', 'Lewis L.', 'M', '1994-12-07',  'll1234@gmail.com', '38545744', 'Graphic designer', 'Staff025');
insert into Staff values ('Staff106', 'Benny B.', 'M', '1965-05-11', 'bb9999@gmail.com', '81364474', 'Actor', 'Staff036');
insert into Staff values ('Staff107', 'Mary M.', 'F', '1995-09-28', 'mm4321@gmail.com', '17374754', 'Actor', 'Staff036');
insert into Staff values ('Staff112', 'Rachel R.', 'F', '1996-01-31', 'rr5678@gmail.com', '95762359', 'Model', 'Staff049');
insert into Staff values ('Staff126', 'Victoria V.', 'F', '1995-05-23', 'vv0000@gmail.com', '73465913', 'Model', 'Staff049');



insert into FulltimeStaff values ('Staff001', 'Room 301/ L3/ Main Bdg');
insert into FulltimeStaff values ('Staff005', 'Room 302/ L3/ Main Bdg');
insert into FulltimeStaff values ('Staff009', 'Room 201/ L2/ Main Bdg');
insert into FulltimeStaff values ('Staff010', 'Room 202/ L2/ Main Bdg');
insert into FulltimeStaff values ('Staff016', 'Room 203/ L2/ Main Bdg');
insert into FulltimeStaff values ('Staff025', 'Room 101/ L1/ Main Bdg');
insert into FulltimeStaff values ('Staff036', 'Room 102/ L1/ Main Bdg');
insert into FulltimeStaff values ('Staff049', 'Room 103/ L1/ Main Bdg');



insert into CasualStaff values ('Staff101', 'Graphic design');
insert into CasualStaff values ('Staff106', 'Acting');
insert into CasualStaff values ('Staff107', 'Acting');
insert into CasualStaff values ('Staff112', 'Modeling');
insert into CasualStaff values ('Staff126', 'Modeling');



insert into DirAccManager values ('Staff001');
insert into DirAccManager values ('Staff005');
insert into DirAccManager values ('Staff009');
insert into DirAccManager values ('Staff010');
insert into DirAccManager values ('Staff016');



insert into Client values ('CL001', 'Company A', 'AA Street, Sydney, NSW', 'Andrew A.', '73591157', 'andy.a@companya.com.au', 'Staff001');
insert into Client values ('CL004', 'Company B', 'BB Street, Sydney, NSW', 'Becky B.', '27544573', 'becky.b@companyb.com.au', 'Staff005');
insert into Client values ('CL013', 'Company F', 'FF Street, Sydney, NSW', 'Frank F.', '18567483', 'franky.f@companyf.com.au', 'Staff009');
insert into Client values ('CL017', 'Company H', 'HH Street, Sydney, NSW', 'Howard H.', '93183082', 'howie.h@companyh.com.au', 'Staff009');
insert into Client values ('CL019', 'Company S', 'SS Street, Sydney, NSW', 'Steven S.', '18365463', 'stevie.s@companys.com.au', 'Staff016');



insert into Campaign values ('CPN001', 'Health', 'ABC skin care', '2017-08-19', 'Some random descriptions', 2000000, 
'2018-8-19', 25000, '2018-10-02', 'CL004','Staff005');
insert into Campaign values ('CPN002', 'Luxury', 'DEF cars', '2018-01-15', 'Some random descriptions', 7000000,
 '2018-08-15', 55000, '2018-07-01', 'CL001', 'Staff001');
insert into Campaign values ('CPN003', 'Friendly animals', 'MN Pet product', '2018-02-01', 'Some random descriptions', 1000000, 
'2018-07-01', 5000, '2018-09-15', 'CL017', 'Staff009');
insert into Campaign values ('CPN004', 'Beauty', 'XYZ perfume', '2018-12-25', 'Some random descriptions', 3000000, 
'2019-04-25', 15000, '2019-04-15', 'CL013', 'Staff009');
insert into Campaign values ('CPN005', 'Economy', 'OS banking', '2019-05-15', 'Some random descriptions', 20000000, 
'2019-12-15', 75000, '2019-11-01', 'CL019', 'Staff016');



insert into Advert values ('Ad001.012', 'Some random descriptions', 'Magazines', 800000, 'CPN001');
insert into Advert values ('Ad001.013', 'Some random descriptions', 'Online', 100000, 'CPN001');
insert into Advert values ('Ad002.023', 'Some random descriptions', 'TV', 4000000, 'CPN002');
insert into Advert values ('Ad002.024', 'Some random descriptions', 'Magazines', 2000000, 'CPN002');
insert into Advert values ('Ad003.034', 'Some random descriptions', 'Newspaper', 200000, 'CPN003');
insert into Advert values ('Ad004.045', 'Some random descriptions', 'Online', 250000, 'CPN004');
insert into Advert values ('Ad004.046', 'Some random descriptions', 'TV', 1500000, 'CPN004');
insert into Advert values ('Ad005.057', 'Some random descriptions', 'TV', 15000000, 'CPN005');



insert into Invoice values ('424345', '2018-11-27', 'Paid', '2018-12-14', 'CPN001');
insert into Invoice values ('124673', '2018-07-21', 'Paid', '2018-07-26', 'CPN002');
insert into Invoice values ('357489', '2018-10-04', 'Paid', '2019-01-11', 'CPN003');
insert into Invoice values ('454954', '2019-05-06', 'Paid', '2019-06-16', 'CPN004');
insert into Invoice values ('194793', '2019-11-10', 'Unpaid', NULL, 'CPN005');



insert into WorksOn values ('Staff001', 'CPN002');
insert into WorksOn values ('Staff005', 'CPN001');
insert into WorksOn values ('Staff009', 'CPN003');
insert into WorksOn values ('Staff009', 'CPN004');
insert into WorksOn values ('Staff016', 'CPN005');
insert into WorksOn values ('Staff025', 'CPN001');
insert into WorksOn values ('Staff025', 'CPN003');
insert into WorksOn values ('Staff025', 'CPN005');
insert into WorksOn values ('Staff049', 'CPN004');
insert into WorksOn values ('Staff101', 'CPN001');
insert into WorksOn values ('Staff101', 'CPN004');
insert into WorksOn values ('Staff106', 'CPN005');
insert into WorksOn values ('Staff107', 'CPN001');
insert into WorksOn values ('Staff107', 'CPN004');
insert into WorksOn values ('Staff112', 'CPN002');
insert into WorksOn values ('Staff126', 'CPN003');
insert into WorksOn values ('Staff126', 'CPN004');



insert into RequiresBookingAt values ('Ad001.012', 'Su04', '2017-11-01 16:00:00', 40);
insert into RequiresBookingAt values ('Ad002.023', 'Su03', '2017-03-13 18:00:00', 100);
insert into RequiresBookingAt values ('Ad002.024', 'Su03', '2017-04-10 19:00:00', 30);
insert into RequiresBookingAt values ('Ad004.046', 'Su01', '2018-01-01 18:00:00', 60);
insert into RequiresBookingAt values ('Ad005.057', 'Su02', '2019-05-25 18:00:00', 15);
insert into RequiresBookingAt values ('Ad005.057', 'Su05', '2019-05-29 18:00:00', 30);



insert into Holds values (5, 'Staff001', '2014-01-01', 'Ongoing');
insert into Holds values (5, 'Staff005', '2014-01-01', 'Ongoing');
insert into Holds values (4, 'Staff009', '2016-01-01', 'Ongoing');
insert into Holds values (4, 'Staff010', '2016-01-01', 'Ongoing');
insert into Holds values (4, 'Staff016', '2017-01-01', 'Ongoing');
insert into Holds values (3, 'Staff025', '2017-01-01', 'Ongoing');
insert into Holds values (3, 'Staff036', '2017-01-01', 'Ongoing');
insert into Holds values (3, 'Staff049', '2017-01-01', 'Ongoing');
insert into Holds values (2, 'Staff101', '2017-01-01', 'Ongoing');
insert into Holds values (2, 'Staff106', '2017-01-01', 'Ongoing');
insert into Holds values (2, 'Staff112', '2017-01-01', 'Ongoing');
insert into Holds values (1, 'Staff107', '2017-01-01', 'Ongoing');
insert into Holds values (1, 'Staff126', '2017-01-01', 'Ongoing');


insert into Timesheet values ('TS00001', '2017-01-15', '2018-07-01', 600, 'Staff001', 'CPN002');
insert into Timesheet values ('TS00012', '2017-08-19', '2018-10-02', 1400, 'Staff005', 'CPN001');
insert into Timesheet values ('TS00023', '2018-02-01', '2018-09-15', 800, 'Staff009', 'CPN003');
insert into Timesheet values ('TS00143', '2018-12-25', '2019-04-15', 400, 'Staff009', 'CPN004');
insert into Timesheet values ('TS00243', '2019-05-15', '2019-11-01', 650, 'Staff016', 'CPN005');
insert into Timesheet values ('TS00134', '2017-08-19', '2017-11-15', 160, 'Staff025', 'CPN001');
insert into Timesheet values ('TS03432', '2018-02-01', '2018-04-15', 240, 'Staff025', 'CPN003');
insert into Timesheet values ('TS01112', '2019-05-15', '2019-08-01', 180, 'Staff025', 'CPN005');
insert into Timesheet values ('TS07635', '2019-03-25', '2019-04-15', 50, 'Staff049', 'CPN004');
insert into Timesheet values ('TS05353', '2017-09-10', '2017-09-28', 100, 'Staff101', 'CPN001');
insert into Timesheet values ('TS07426', '2019-02-01', '2019-02-15', 80, 'Staff101', 'CPN004');
insert into Timesheet values ('TS00832', '2019-06-15', '2019-06-15', 20, 'Staff106', 'CPN005');
insert into Timesheet values ('TS02312', '2017-10-10', '2017-10-18', 25, 'Staff107', 'CPN001');
insert into Timesheet values ('TS08563', '2019-04-01', '2019-04-05', 15, 'Staff107', 'CPN004');
insert into Timesheet values ('TS03252', '2017-02-20', '2017-02-21', 12, 'Staff112', 'CPN002');
insert into Timesheet values ('TS23512', '2018-02-11', '2018-02-12', 10, 'Staff126', 'CPN003');
insert into Timesheet values ('TS24516', '2019-04-09', '2019-04-13', 21, 'Staff126', 'CPN004');
