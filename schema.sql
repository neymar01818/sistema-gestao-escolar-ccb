-- ========================================================
-- PROJETO: Sistema de Gestão Escolar - Colégio Cristão de Belém
-- AUTOR: Neymar Furtado Pena
-- OBJETIVO: Criação das tabelas relacionais e consultas analíticas
-- ========================================================

-- 1. Criação das Tabelas (DDL)

CREATE TABLE IF NOT EXISTS turmas (
    id_turma SERIAL PRIMARY KEY,
    nome_turma VARCHAR(50) NOT NULL,
    ano_letivo INT NOT NULL,
    turno VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS alunos (
    id_aluno SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    email_responsavel VARCHAR(100),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS professores (
    id_professor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    especialidade VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS disciplinas (
    id_disciplina SERIAL PRIMARY KEY,
    nome_disciplina VARCHAR(50) NOT NULL,
    carga_horaria INT NOT NULL
);

CREATE TABLE IF NOT EXISTS matriculas (
    id_matricula SERIAL PRIMARY KEY,
    id_aluno INT NOT NULL REFERENCES alunos(id_aluno) ON DELETE CASCADE,
    id_turma INT NOT NULL REFERENCES turmas(id_turma) ON DELETE RESTRICT,
    data_matricula DATE DEFAULT CURRENT_DATE
);

CREATE TABLE IF NOT EXISTS avaliacoes (
    id_avaliacao SERIAL PRIMARY KEY,
    id_aluno INT NOT NULL REFERENCES alunos(id_aluno) ON DELETE CASCADE,
    id_disciplina INT NOT NULL REFERENCES disciplinas(id_disciplina) ON DELETE RESTRICT,
    tipo_avaliacao VARCHAR(30) NOT NULL,
    nota NUMERIC(4,2) CHECK (nota >= 0 AND nota <= 10),
    data_avaliacao DATE NOT NULL
);

-- 2. Inserção de Dados Exemplo (DML) - 5ª Série ao Convênio

INSERT INTO turmas (nome_turma, ano_letivo, turno) VALUES 
('Convênio (3º Ano EM / Pré-Vestibular)', 2026, 'Manhã'),
('5ª Série / 6º Ano Ensino Fundamental', 2026, 'Manhã'),
('9º Ano Ensino Fundamental', 2026, 'Tarde');

INSERT INTO alunos (nome, data_nascimento, email_responsavel) VALUES 
('Arthur Lima', '2008-05-14', 'responsavel.arthur@email.com'),
('Sâmilly Vitória', '2008-09-22', 'responsavel.samilly@email.com'),
('Caio Teixeira', '2014-03-10', 'responsavel.caio@email.com');

INSERT INTO disciplinas (nome_disciplina, carga_horaria) VALUES 
('Matemática', 160),
('Física', 120),
('Redação', 80);

INSERT INTO matriculas (id_aluno, id_turma) VALUES 
(1, 1),
(2, 1),
(3, 2);

INSERT INTO avaliacoes (id_aluno, id_disciplina, tipo_avaliacao, nota, data_avaliacao) VALUES 
(1, 1, 'Simulado Geral Convênio', 9.50, '2026-03-15'),
(1, 2, 'Simulado Geral Convênio', 8.75, '2026-03-15'),
(2, 1, 'Simulado Geral Convênio', 8.00, '2026-03-15'),
(2, 3, 'Simulado Geral Convênio', 9.00, '2026-03-15'),
(3, 1, 'Avaliação Mensal Matemática', 8.50, '2026-03-18');

-- 3. Consulta Analítica: Relatório de Médias por Aluno e Disciplina (DQL)

CREATE OR REPLACE VIEW view_desempenho_alunos AS
SELECT 
    a.nome AS nome_aluno,
    t.nome_turma,
    d.nome_disciplina,
    ROUND(AVG(av.nota), 2) AS media_notas,
    COUNT(av.id_avaliacao) AS total_avaliacoes
FROM alunos a
JOIN matriculas m ON a.id_aluno = m.id_aluno
JOIN turmas t ON m.id_turma = t.id_turma
JOIN avaliacoes av ON a.id_aluno = av.id_aluno
JOIN disciplinas d ON av.id_disciplina = d.id_disciplina
GROUP BY a.nome, t.nome_turma, d.nome_disciplina;
