/*
모델링 프로젝트 210603

조원 : 윤정화, 최한승, 손정현, 박태영

주제 : 요즘 인기있는 예능 프로그램 조회 사이트

*/

-- 1. 테이블 생성
create table star(
	star_id number(4) primary key,
    star_name varchar2(20) not null,
	star_gender char(1) constraint ck_star_gender check (star_gender in ('F', 'M'))
);

create table day(
	day_id number(1) primary key,
    day_name varchar2(10) not null
);

create table genre(
	gen_id number(2) primary key,
    gen_name varchar2(20) not null
);

create table age(
	age_id number(2) primary key,
    age_name varchar2(20) not null
);

create table program(
    pro_id number(6) primary key,
    pro_name varchar2(50) not null,
    day_id number(1),
    gen_id number(2),
    age_id number(2),
    pro_ratings number(3,1) not null,
    constraint fk_program_day_id foreign key (day_id) references day(day_id),
    constraint fk_program_gen_id foreign key (gen_id) references genre(gen_id),
    constraint fk_program_age_id foreign key (age_id) references age(age_id)
);

create table casting(
	pro_id number(2),
    star_id number(4),
    constraint pk_casting primary key (pro_id,star_id),
    constraint fk_casting_pro_id foreign key (pro_id) references program(pro_id)
    constraint fk_casting_star_id foreign key (star_id) references star(star_id)
);



-- 2. 데이터 insert

-- 2-1. star 테이블 정보
insert into star values('1', '강호동', 'M');
insert into star values('2', '규현', 'M');
insert into star values('3', '김구라', 'M');
insert into star values('4', '김국진', 'M');
insert into star values('5', '김동현', 'M');
insert into star values('6', '김성주', 'M');
insert into star values('7', '김숙', 'F');
insert into star values('8', '김영철', 'M');
insert into star values('9', '김종국', 'M');
insert into star values('10', '김준현', 'M');
insert into star values('11', '김희철', 'M');
insert into star values('12', '민경훈', 'M');
insert into star values('13', '박성광', 'M');
insert into star values('14', '서장훈', 'M');
insert into star values('15', '송민호', 'M');
insert into star values('16', '송지효', 'F');
insert into star values('17', '신동엽', 'M');
insert into star values('18', '안영미', 'F');
insert into star values('19', '양세찬', 'M');
insert into star values('20', '오지호', 'M');
insert into star values('21', '유세윤', 'M');
insert into star values('22', '유재석', 'M');
insert into star values('23', '은지원', 'M');
insert into star values('24', '이경규', 'M');
insert into star values('25', '이광수', 'M');
insert into star values('26', '이덕화', 'M');
insert into star values('27', '이상민', 'M');
insert into star values('28', '이수근', 'M');
insert into star values('29', '이태곤', 'M');
insert into star values('30', '장동민', 'M');
insert into star values('31', '전소민', 'F');
insert into star values('32', '전진', 'M');
insert into star values('33', '지석진', 'M');
insert into star values('34', '츄', 'F');
insert into star values('35', '피오', 'M');
insert into star values('36', '하하', 'M');

-- 2-2 요일 테이블 정보
insert into day values('1', '월요일');
insert into day values('2', '화요일');
insert into day values('3', '수요일');
insert into day values('4', '목요일');
insert into day values('5', '금요일');
insert into day values('6', '토요일');
insert into day values('7', '일요일');

-- 2-3 장르 테이블 정보
insert into genre values(1, '둘다');
insert into genre values(2, '실내');
insert into genre values(3, '실외');

-- 2-4 나이 테이블 정보
insert into age values('1', '15세');
insert into age values('2', '12세');

-- 2-5 프로그램 테이블 정보
insert into program values(1,'동상이몽',1,1,1,6.4);
insert into program values(2,'미운오리새끼',7,1,1,14.6);
insert into program values(3,'아는형님',6,2,1,3.1);

-- 2-6 캐스팅 테이블 정보
insert into casting values(1,3);
insert into casting values(1,14);
insert into casting values(1,7);
insert into casting values(1,13);
insert into casting values(1,32);
insert into casting values(1,20);

insert into casting values(2,17);
insert into casting values(2,14);
insert into casting values(2,11);
insert into casting values(2,27);
insert into casting values(2,9);

insert into casting values(3,1);
insert into casting values(3,14);
insert into casting values(3,28);
insert into casting values(3,11);
insert into casting values(3,12);
insert into casting values(3,9);
insert into casting values(3,8);

insert into casting values(4,22);
insert into casting values(4,9);
insert into casting values(4,36);
insert into casting values(4,33);
insert into casting values(4,31);
insert into casting values(4,25);
insert into casting values(4,19);
insert into casting values(4,16);

insert into casting values(5,3);
insert into casting values(5,4);
insert into casting values(5,18);
insert into casting values(5,21);

insert into casting values(6,1);
insert into casting values(6,2);
insert into casting values(6,23);
insert into casting values(6,15);
insert into casting values(6,28);
insert into casting values(6,35);

insert into casting values(7,6);
insert into casting values(7,30);
insert into casting values(7,11);
insert into casting values(7,5);
insert into casting values(7,34);

insert into casting values(8,28);
insert into casting values(8,14);

insert into casting values(9,24);
insert into casting values(9,26);
insert into casting values(9,28);
insert into casting values(9,10);
insert into casting values(9,29);

-- 3. 조회할 데이터 select문

-- 3-1. 프로그램별 출연자 정보 조회
select p.pro_name, s.star_name, s.star_gender
from program p inner join casting c on p.pro_id = c.pro_id
               inner join star s on c.star_id = s.star_id;

-- 3-2. 특정 요일별 프로그램 조회

-- 3-3. 연령 제한별 프로그램 조회

-- 3-4. 특정 출연자가 출연한 프로그램들 조회