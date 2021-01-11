/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  11/01/2021 21:58:41                      */
/*==============================================================*/


drop table if exists APPARTIENT_E_M;

drop table if exists ETUDIANT;

drop table if exists MODULE;

drop table if exists SPECIALITE;

/*==============================================================*/
/* Table : APPARTIENT_E_M                                       */
/*==============================================================*/
create table APPARTIENT_E_M
(
   ID_ETUD              int not null,
   ID_MODULE            int not null,
   primary key (ID_ETUD, ID_MODULE)
);

/*==============================================================*/
/* Table : ETUDIANT                                             */
/*==============================================================*/
create table ETUDIANT
(
   ID_ETUD              int not null,
   ID_SPECIAL           int not null,
   NOM_ETUD             varchar(50) not null,
   PRENOM_ETUD          varchar(50) not null,
   TELEPHONE_ETUD       varchar(45) not null,
   EMAIL_ETUD           varchar(100) not null,
   primary key (ID_ETUD)
);

/*==============================================================*/
/* Table : MODULE                                               */
/*==============================================================*/
create table MODULE
(
   ID_MODULE            int not null,
   ID_SPECIAL           int not null,
   NOM_MODULE           varchar(50) not null,
   SALLE_MODULE         varchar(50) not null,
   PROFESSEUR_MODULE    varchar(100) not null,
   primary key (ID_MODULE)
);

/*==============================================================*/
/* Table : SPECIALITE                                           */
/*==============================================================*/
create table SPECIALITE
(
   ID_SPECIAL           int not null,
   NOM_SPECIAL          varchar(200) not null,
   primary key (ID_SPECIAL)
);

alter table APPARTIENT_E_M add constraint FK_APPARTIENT_E_M foreign key (ID_ETUD)
      references ETUDIANT (ID_ETUD) on delete restrict on update restrict;

alter table APPARTIENT_E_M add constraint FK_APPARTIENT_E_M2 foreign key (ID_MODULE)
      references MODULE (ID_MODULE) on delete restrict on update restrict;

alter table ETUDIANT add constraint FK_APPARTIENT_E_S foreign key (ID_SPECIAL)
      references SPECIALITE (ID_SPECIAL) on delete restrict on update restrict;

alter table MODULE add constraint FK_APPARTIENT_S_M foreign key (ID_SPECIAL)
      references SPECIALITE (ID_SPECIAL) on delete restrict on update restrict;

