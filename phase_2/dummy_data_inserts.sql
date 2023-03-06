INSERT INTO category (id, cat_type)
VALUES ('C1', 'must evac, secure lockdown'),
('C2', 'may evac, secure lockdown'),
('C3', 'no evac, limited lockdown'),
('C4', 'no evac, no lockdown');

INSERT INTO func (func_name)
VALUES ('Transportation'),
('Communications'),
('Engineering'),
('Search and Rescue'),
('Education'),
('Energy'),
('Firefighting'),
('Human Services');

INSERT INTO unit (unit_name)
VALUES ('day'),
('hour'),
('week'),
('month');

INSERT INTO user (username, pass, display_name, user_role)
VALUES ('Check1', 'passcheck1', 'Checky1', 'cimt'),
('Check2', 'passcheck2','Checky2', 'rp'),
('Check3', 'passcheck3','Checky3', 'admin');

INSERT INTO cimt (username, phone_num)
VALUES ('Check1', '5555555555');

INSERT INTO resource_provider (username, strt_addr)
VALUES ('Check2', '222 22nd Ave Pasadena, CA');

INSERT INTO admin_user (username, email)
VALUES ('Check3', 'test@test.com');

INSERT INTO incident(descript, inc_owner, cat_id)
VALUES ('description1','Check1', 'C1'),
('description2', 'Check1', 'C3'),
('description3', 'Check2', 'C2');

INSERT INTO emergency_resource (res_owner, res_name, prim_func_num, sec_func_num, distance, capabilities, price, unit_id)
VALUES ('Check1', 'resource1', 1, 4, 34.1, 'capability1, capability2, capability3', 12.1, 2),
('Check3', 'resource2', 1, 3, 12.1, 'capability4, capability5, capability6', 1.2, 1),
('Check2', 'resource5', 2, 1, 2.1, 'capability1, capability2, capability3', 24.4, 3);

INSERT INTO emergency_resource (res_owner, res_name, prim_func_num, sec_func_num, distance, price, unit_id)
VALUES ('Check1', 'resource4', 3, 4, 9.1, 2.2, 2),
('Check1', 'resource6', 2, 5, 1.0, 253.2, 1);

INSERT INTO emergency_resource (res_owner, res_name, prim_func_num, price, unit_id)
VALUES ('Check3', 'resource7', 3, 1, 1),
('Check2', 'resource8', 2, 5, 2);

INSERT INTO emergency_resource (res_owner, res_name, prim_func_num, distance, price, unit_id)
VALUES ('Check1', 'resource9', 3, 20.1,2.2, 3),
('Check2', 'resource10', 2, 43.1, 32.2, 1);

INSERT INTO emergency_resource (res_owner, res_name, prim_func_num, sec_func_num, price, unit_id)
VALUES ('Check2', 'resource11', 3, 6, 54.3, 3),
('Check3', 'resource12', 2, 8, 3, 3);