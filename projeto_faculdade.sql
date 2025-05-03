create database Faculdade_Estudo_Mais;
use Faculdade_Estudo_Mais;
drop database Faculdade_Estudo_Mais;

create table professor(
id int not null primary key auto_increment,
nome_prof varchar(45) not null,
especialidade varchar(45) not null,
unique index(id)
);

insert into professor(nome_prof,especialidade)
               values('Dolores','Estudo da Tradução'),
                     ('Paulo','Engenharia das Estruturas'),
                     ('Mariane','Inteligência Artifical');
select*from professor;

create table telefone_professor(
id int not null primary key auto_increment,
tel_prof varchar(45),
id_professor int not null,

constraint FK_Cel_Prof
foreign key(id_professor) references professor(id),
unique index(id)
);

insert into telefone_professor(tel_prof,id_professor)
                        values('03034222344',1),
                              ('02034453453',2),
                              ('04023443245',3);
select*from telefone_professor;

create table email_professor(
id int not null primary key auto_increment,
email_prof varchar(45) not null,
id_professor int not null,

constraint FK_Prof_Email_Prof
foreign key(id_professor) references email_professor(id),
unique index(id)
);

insert into email_professor(email_prof, id_professor)
                     values('dolores78uf@hotmail.com',1),
                           ('EngTutorPauloS55@outlook.com',2),
                           ('instrutoramariane94KH@gmail.com',3);
select*from email_professor;

create table curso(
id int not null primary key auto_increment,
tipo_curso varchar(45) not null,
total_horas int not null,
duracao_semestre varchar(45) not null,
descricao varchar(45) not null,
unique index(id)
);

insert into curso(tipo_curso,
                  total_horas,
                  duracao_semestre,
                  descricao)
		   values('Bacharelado em Ciência da Computação',3200,'8 semestres (4 anos)','Foco em Inteligência Artificial'),
                 ('Licenciatura em Letras Português/Inglês',2800,'8 semestres (4 anos)', 'Ênfase em Tradução'),
                 ('Bacharelado em Engenharia Civil',4000,'10 semestres (5 anos)','Foco em Projeto e Construção de Estuturas');
select*from curso;
                 

create table aluno(
id int not null primary key auto_increment,
nome_aluno varchar(45) not null,
data_nasc date not null,
data_matricula date not null,
id_curso int not null,

constraint FK_Curso_Aluno
foreign key(id_curso) references curso(id),
unique index(id)
);
select*from aluno;

insert into aluno(nome_aluno,
                  data_nasc,
                  data_matricula,
                  id_curso)
		  values('João','1987-2-5','2023-3-2',3),
                ('Francisco','1996-8-27','2022-2-26',1),
                ('Larissa','1999-9-17','2023-8-1',2);
select*from aluno;

create table telefone_aluno(
id int not null primary key auto_increment,
tel_aluno varchar(45) not null,
id_aluno int not null,

constraint FK_Cel_Aluno
foreign key(id_aluno) references aluno(id),
unique index(id)
);

insert into telefone_aluno(tel_aluno,id_aluno)
                    values('03099443344',1),
                          ('02079880966',2),
                          ('05088834551',3);
select*from telefone_aluno;

create table email_aluno(
id int not null primary key auto_increment,
email_aluno varchar(45) not null,
id_aluno int not null,

constraint FK_Aluno_Aluno_Email
foreign key(id_aluno) references aluno(id),
unique index(id)
);

insert into email_aluno(email_aluno,id_aluno)
                 values('joaozin34Brzz@hotmail.com',1),
                       ('code93op11@gmail.com',2),
                       ('mos99sp_sil@outlook.com',3);
select*from email_aluno;

create table endereco_aluno(
id int not null primary key auto_increment,
logradouro varchar(45) not null,
bairro varchar(45) not null,
cep varchar(45) not null,
cidade varchar(45) not null,
estado varchar(45) not null,
pais varchar(45) not null,
id_aluno int not null,

constraint FK_End_Aluno
foreign key(id_aluno) references aluno(id),
unique index(id)
);
select*from endereco_aluno;

create table grupo(
id int not null primary key auto_increment,
nome_grupo varchar(45) not null,
periodo_grupo varchar(45) not null,
modalidade varchar(45) not null,
disciplina_grupo varchar(45) not null,
carga_horaria int not null,
hora_semanal int not null,
duracao_aula varchar(15) not null,
qtde_falta_permitida int not null,
unique index(id)
);

insert into grupo(nome_grupo,
                  periodo_grupo,
				  modalidade,
				  disciplina_grupo,
                  carga_horaria,
                  hora_semanal, duracao_aula, 
                  qtde_falta_permitida)
		   values('Grupo A','Manhã','Presencial','Algoritmo',80,4,'1h30min',8),
				 ('Grupo D','Período Letivo','EAD','Linguística do Inglês',80,4,'2hrs',8),
                 ('Grupo G','Tarde','Híbrido','Áreas Fundamentais',75,3,'45min',8);
select*from grupo;

create table turma(
id int not null primary key auto_increment,
id_professor int not null,
id_aluno int not null,
id_grupo int not null,

constraint FK_Professor_Turma
foreign key(id_professor) references professor(id),

constraint FK_Aluno_Turma
foreign key(id_aluno) references aluno(id),

constraint FK_Grupo_Turma
foreign key(id_grupo) references grupo(id),
unique index(id)
);

insert into turma(id_professor, id_aluno, id_grupo)
           values(2,1,3),
                 (3,2,1),
                 (1,3,2);
select*from turma;

create table avaliacao(
id int not null primary key auto_increment,
tipo_avaliacao varchar(100),
valor_total int not null,
max_tentativa int not null,
id_professor int not null,

constraint FK_Professor_Avaliacao
foreign key(id_professor) references professor(id),
unique index(id)
);

insert into avaliacao(tipo_avaliacao,
                      valor_total,
                      max_tentativa,
                      id_professor)
			   values('Questionário sobre Geotecnia',50,3,2),
					 ('Participação Aula ao Vivo sobre Cálculo Numérico',30,1,3),
                     ('Prova Final Letras',50,1,1);
select*from avaliacao;

create table resultado_avaliacao(
id int not null primary key auto_increment,
data_aplicacao date null,
data_correcao date null,
nota_aluno float null,
status_aluno varchar(45) not null,
num_tentativa int null,
id_avaliacao int not null,
id_aluno int not null,

constraint FK_Resultado_Prova
foreign key(id_avaliacao) references avaliacao(id),

constraint FK_Aluno_Avaliacao
foreign key(id_aluno) references aluno(id),
unique index(id)
);

insert into resultado_avaliacao(data_aplicacao,
                                data_correcao,
                                nota_aluno,
                                status_aluno,
                                num_tentativa,
                                id_avaliacao,
                                id_aluno)
					    values('2025-3-15','2025-3-18',45,'Aprovado',1,1,1),
							  ('2025-4-20','2025-4-28',22,'Não Aprovado',1,2,2),
                              ('2025-3-30','2025-4-15',45,'Aprovado',1,3,3);
select*from resultado_avaliacao;

create table horario_aulas(
id int not null primary key auto_increment,
dia_semana varchar(45) not null,
horario_inicio time not null,
horario_fim time not null,
id_grupo int not null,

constraint FK_Grupo_Horario
foreign key(id_grupo) references grupo(id),
unique index(id)
);

insert into horario_aulas(dia_semana,
                           horario_inicio,
                           horario_fim,
                           id_grupo)
					values('Segunda-feira','10:00:00','12:00:00',1),
                          ('Segunda-feria','13:00:00','15:00:00',2),
                          ('Terça-feira','15:00:00','17:00:00',3);
select*from horario_aulas;


create table faltas(
id int not null primary key auto_increment,
data_falta date not null,
motivo varchar(45) not null,
qtde_falta int not null,
justificada varchar(15) not null,
id_aluno int not null,
id_grupo int not null,

constraint FK_Aluno_Falta
foreign key(id_aluno) references aluno(id),

constraint FK_Grupo_Falta
foreign key(id_grupo) references grupo(id),
unique index(id)
);

insert into faltas(data_falta,
                       motivo,
                       qtde_falta,
                       justificada,
                       id_aluno,
                       id_grupo)
			    values('2025-2-3','Consulta Médica',1,'Sim',3,2),
                      ('2025-1-3','Problema de Transporte',4,'Não',2,1);
select*from faltas;

create table historico_aluno(
id int not null primary key auto_increment,
nota_final decimal(10,2) not null,
status_aprovacao varchar(45),
data_conclusao date not null,
total_faltas int null,
id_aluno int not null,
id_grupo int not null,

constraint Fk_TotalFaltas_Historico
foreign key(id_aluno) references aluno(id),

constraint FK_Grupo_Historico
foreign key(id_grupo) references grupo(id),
unique index(id)
);

insert into historico_aluno(nota_final,
							status_aprovacao,
							data_conclusao,
                            total_faltas,
                            id_aluno,
                            id_grupo)
					 values(8.5,'Aprovado','2025-5-30',1,3,2);
select*from historico_aluno;


                           

