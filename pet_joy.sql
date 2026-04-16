CREATE DATABASE petjoy;
SET FOREIGN_KEY_CHECKS = 0;


-- Estrutura da tabela `usuarios`
CREATE TABLE usuarios (
  
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `telefone` BIGINT(15) DEFAULT NULL,
  `data_nasc` DATE DEFAULT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `cep` INT(9) NOT NULL,
  `rua` VARCHAR(100) NOT NULL,  
  `numero` INT(5) NOT NULL,
  `complemento` VARCHAR(50) DEFAULT NULL,
  `bairro` VARCHAR(50) NOT NULL,
  `cidade` VARCHAR(50) NOT NULL,
  `estado_uf` VARCHAR(25) NOT NULL,
  `referencia` VARCHAR(100) DEFAULT NULL,
  `nome_pet` VARCHAR(50) DEFAULT NULL,
  `raca` VARCHAR(30) DEFAULT NULL,
  `especie` VARCHAR(30) DEFAULT NULL,
  `idade` INT(3) DEFAULT NULL,
  `peso` FLOAT DEFAULT NULL,
  `genero` ENUM('Macho', 'Fêmea') DEFAULT NULL,
  `observacoes` VARCHAR(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Estrutura da tabela `animais`
CREATE TABLE animais (
  `animal_id` INT AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL,
  `especie` VARCHAR(50) DEFAULT NULL,
  `raca` VARCHAR(50) DEFAULT NULL,
  `idade` INT DEFAULT NULL,
  `sexo` ENUM('Macho', 'Fêmea') DEFAULT NULL,
  `cliente_id` INT NOT NULL,
  `data_registro` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`cliente_id`) REFERENCES `usuarios`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Estrutura da tabela `produtos`
CREATE TABLE produtos (
  `produto_id` INT AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` TEXT DEFAULT NULL,
  `preco` DECIMAL(10, 2) DEFAULT NULL,
  `quantidade_estoque` INT DEFAULT NULL,
  `categoria` VARCHAR(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Estrutura da tabela `servicos`
CREATE TABLE servicos (
  `servico_id` INT AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` TEXT DEFAULT NULL,
  `preco` DECIMAL(10, 2) DEFAULT NULL,
  `duracao` INT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Estrutura da tabela `vendas`
CREATE TABLE vendas (
  `venda_id` INT AUTO_INCREMENT PRIMARY KEY,
  `cliente_id` INT NOT NULL,
  `produto_id` INT NOT NULL,
  `quantidade` INT DEFAULT NULL,
  `data_venda` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `valor_total` DECIMAL(10, 2) DEFAULT NULL,
  FOREIGN KEY (`cliente_id`) REFERENCES `usuarios`(`id`),
  FOREIGN KEY (`produto_id`) REFERENCES `produtos`(`produto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Estrutura da tabela `agendamentos`
CREATE TABLE agendamentos (
  `agendamento_id` INT AUTO_INCREMENT PRIMARY KEY,
  `cliente_id` INT NOT NULL,
  `animal_id` INT NOT NULL,
  `servico_id` INT NOT NULL,
  `data_agendamento` DATETIME DEFAULT NULL,
  `status` ENUM('Agendado', 'Realizado', 'Cancelado') DEFAULT NULL,
  FOREIGN KEY (`cliente_id`) REFERENCES `usuarios`(`id`),
  FOREIGN KEY (`animal_id`) REFERENCES `animais`(`animal_id`),
  FOREIGN KEY (`servico_id`) REFERENCES `servicos`(`servico_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


COMMIT;

    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


COMMIT;
