CREATE TABLE CIDADE(
	cod_cidade INT NOT NULL,
	nome_cidade VARCHAR(45) NOT NULL,
	PRIMARY KEY (cod_cidade));

CREATE TABLE PESSOA(
	cod_pessoa INT NOT NULL,
	nome_pessoa VARCHAR (45) NOT NULL,
	telefone_pessoa INT NOT NULL,
	cod_cidade INT NOT NULL,
		PRIMARY KEY (cod_pessoa),
		FOREIGN KEY (cod_cidade) REFERENCES CIDADE (cod_cidade)
			ON DELETE CASCADE
			ON UPDATE CASCADE);

CREATE TABLE ESCOLA(
	cod_escola INT NOT NULL,
	nome_escola VARCHAR (45) NOT NULL,
	cod_cidade INT NOT NULL,
		PRIMARY KEY (cod_escola),
		FOREIGN KEY (cod_cidade) REFERENCES CIDADE (cod_cidade)
			ON DELETE CASCADE
			ON UPDATE CASCADE);

CREATE TABLE PROFESSOR(
	RG INT NOT NULL,
	CPF INT NOT NULL,
	Titulação VARCHAR (45) NOT NULL,
	cod_pessoa INT NOT NULL,
	cod_escola INT NOT NULL,
		PRIMARY KEY (CPF),
		UNIQUE KEY (RG),
		FOREIGN KEY (cod_pessoa) REFERENCES PESSOA (cod_pessoa)
			ON DELETE CASCADE
			ON UPDATE CASCADE,
		FOREIGN KEY (cod_escola) REFERENCES ESCOLA (cod_escola)
			ON UPDATE CASCADE
			ON DELETE CASCADE);

CREATE TABLE TURMA (
	cod_turma INT NOT NULL,
	nome_turma VARCHAR (45) NOT NULL,
	cod_escola INT NOT NULL,
		PRIMARY KEY (cod_turma),
		FOREIGN KEY (cod_escola) REFERENCES ESCOLA (cod_escola)
			ON UPDATE CASCADE
			ON DELETE CASCADE);

CREATE TABLE ALUNO(
	matricula_aluno INT NOT NULL,
	data_nascimento VARCHAR(15) NOT NULL,
	cod_turma INT NOT NULL,
	cod_pessoa INT NOT NULL,
		PRIMARY KEY (cod_pessoa),
		FOREIGN KEY (cod_pessoa) REFERENCES PESSOA (cod_pessoa)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
		FOREIGN KEY (cod_turma) REFERENCES TURMA (cod_turma)
			ON DELETE CASCADE
			ON UPDATE CASCADE);

CREATE TABLE CONTATO(
	telefone_contato INT NOT NULL,
	nome_contato VARCHAR(45) NOT NULL,
	cod_pessoa INT NOT NULL,
		PRIMARY KEY (nome_contato),
		FOREIGN KEY (cod_pessoa) REFERENCES ALUNO (cod_pessoa)
			ON UPDATE CASCADE
			ON DELETE CASCADE);

CREATE TABLE DISCIPLINA(
	cod_disciplina INT NOT NULL,
	nome_disciplina VARCHAR (50),
		PRIMARY KEY (cod_disciplina));

CREATE TABLE MINISTRA(
	cod_ministra INT NOT NULL,
	cod_disciplina INT NOT NULL,
	cod_pessoa INT NOT NULL,
	cod_turma INT NOT NULL,
		PRIMARY KEY (cod_ministra),
		FOREIGN KEY (cod_disciplina) REFERENCES DISCIPLINA (cod_disciplina)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
		FOREIGN KEY (cod_pessoa) REFERENCES PROFESSOR (cod_pessoa)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
		FOREIGN KEY (cod_turma) REFERENCES TURMA (cod_turma)
			ON UPDATE CASCADE
			ON DELETE CASCADE);

			

	
		
		
	
		
