# Sistema de Gestão Escolar e Acadêmica (Colégio Cristão de Belém)

## 📌 Descrição do Projeto
Projeto de modelagem e implementação de banco de dados relacional voltado à automação e gestão pedagógica do **Colégio Cristão de Belém**. O sistema centraliza o controlo de matrículas, turmas, corpo docente, notas e avaliações diagnósticas/simulados, otimizando o fluxo de dados para a tomada de decisão da coordenação.

## 🎯 Objetivos
- Modelar e normalizar a base de dados relacional (1FN, 2FN e 3FN).
- Implementar integridade referencial com chaves primárias e estrangeiras.
- Criar views analíticas para acompanhamento do desempenho por turma e disciplina.
- Automatizar relatórios de aproveitamento escolar e controlo de frequência.

## 🛠️ Tecnologias e Ferramentas
- **SGBD:** PostgreSQL / MySQL
- **Linguagem:** SQL (DDL, DML, DQL)
- **Modelagem Conceitual/Lógica:** MER / DER (Draw.io / MySQL Workbench)

## 🗂️ Estrutura do Banco de Dados
O modelo contempla as seguintes entidades relacionais principais:
- `alunos`: Registo cadastral e dados do discente.
- `professores`: Corpo docente e atribuições disciplinares.
- `turmas`: Segmentos escolares da 5ª série / 6º ano do Ensino Fundamental ao Convênio (3º ano EM), anos letivos e turnos.
- `disciplinas`: Componentes curriculares.
- `matriculas`: Associação de alunos às respetivas turmas.
- `avaliacoes`: Notas de provas regulares, trabalhos e simulados diagnósticos.

## 🚀 Como Executar os Scripts
1. Clone este repositório:
```bash
git clone https://github.com/neymar01818/sistema-gestao-escolar-ccb.git
```
2. Importe o ficheiro `schema.sql` no seu SGBD de preferência.
3. Execute as consultas analíticas para gerar as visões de desempenho.

## 👨‍💻 Autor
Neymar Furtado Pena  
Graduação em Banco de Dados
