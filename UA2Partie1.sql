create database gestionEmploiDuTemps;
use	gestionEmploiDuTemps; 


create table etudiant (
numEtudiant int(5)  not null primary key auto_increment,
nom varchar(11) not null,
prenom varchar(11) not null,
age int
);
desc etudiant;

create table enseignant(
id int not null primary key auto_increment,
nom varchar(11) not null,
prenom varchar(110 ) not null
);
desc enseignant;
 
 create table cours(
 cote int (5)not null primary key auto_increment,
 intitule varchar(25) not null,
 enseignantResponsable varchar(25) not null,
 nombreSeances int default '0' not null
 );
 desc cours;
 
 create table seance(
 cours int not null,
 etudiant int not null,
 enseignant int not null,
 type int check(type in( 'Theorie','Pratique') )not null,
 date date not null,
 salle int(3) not null,
 heureDebut  time not null,
 heureFin time not null,
 
 constraint  fk_seance_cours
foreign key (cours)
references cours(cours),
 constraint  fk_seance_etudiant
foreign key (etudiant)
references etudiant(etudiant),
 constraint  fk_seance_enseignant
foreign key (enseignant)
references enseignant(enseignant)
 
 ); 
 desc seance;
alter table seance
add primary key(cours, etudiant,enseignant);

create table inscription (
numInscription int not null primary key auto_increment,
etudiant int not null,
cours int not null,

constraint  fk_cours_inscription
foreign key (cours)
references cours(cours),
constraint  fk_etudiant_inscription
foreign key (etudiant)
references etudiant(etudiant)

);
desc inscription;

insert into etudiant(numEtudiant,nom ,prenom,age)
values(1,'Barre','Arame',22);
select * from etudiant limit 5;

insert into enseignant(id,nom,prenom)
values(1,'Katet','Mounir');
select * from enseignant limit 5;

insert into cours(cote,intitule, enseignantResponsable, nombreSeances)
values(2,'Base de donnés','Mounir',1);
select * from cours limit 5;



