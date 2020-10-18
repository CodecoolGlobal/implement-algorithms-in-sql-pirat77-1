create or replace function breadthFirstSearch(root int)
    returns boolean
    as $$
        DECLARE
            node record;
            child record;
        BEGIN

            create table padawans(
                employee_id smallint NOT NULL,
                last_name character varying(20) NOT NULL,
                first_name character varying(20) NOT NULL,
                reports_to smallint
            );

            create table queque(
                employee_id smallint NOT NULL,
                last_name character varying(20) NOT NULL,
                first_name character varying(20) NOT NULL,
                reports_to smallint
            );

            FOR node in select employee_id, last_name, first_name, reports_to from employees where reports_to=root
                loop
                    insert into queque(employee_id, last_name, first_name, reports_to)
                        values (node.employee_id, node.last_name, node.first_name, node.reports_to);
                    insert into padawans(employee_id, last_name, first_name, reports_to)
                        values (node.employee_id, node.last_name, node.first_name, node.reports_to);
                end loop;

            WHILE (select count(*) from queque) >0
                loop
                    for node in select employee_id, last_name, first_name, reports_to  from queque
                        loop
                            for child in select * from employees e left join padawans p on p.employee_id=e.employee_id
                                where e.reports_to=node.employee_id and p.employee_id is null
                                loop
                                    insert into queque(employee_id, last_name, first_name, reports_to)
                                        values (child.employee_id, child.last_name, child.first_name, child.reports_to);
                                    insert into padawans(employee_id, last_name, first_name, reports_to)
                                        values (child.employee_id, child.last_name, child.first_name, child.reports_to);
                                end loop;
                            delete from queque where employee_id=node.employee_id;
                        end loop;
                end loop;
            drop table queque;
            return true;
        END;
    $$ language plpgsql;

do $$
    declare
        misio boolean;
        node record;
        counter int := 0;
	begin
        drop table if exists padawans;
		misio := breadthFirstSearch(3);
        for node in select * from padawans
            loop
                raise notice '%', node;
                counter := counter + 1;
            end loop;
        raise notice 'total: %', counter;
	end $$