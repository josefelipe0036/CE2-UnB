gerar.albuns <- function(n.figuras, n.pacote, n.simulacoes, probabilidades) {
  resultado <- matrix(nr=n.simulacoes, nc=n.figuras) # Criando uma matriz para os dados
  for (simulacao in 1:n.simulacoes) {
    # Para cada simulação de 1 a n.simulações, faça...
    faltantes <- n.figuras # Número de figurinhas faltantes no início do processo
    figuras.obtidas <- numeric(n.figuras) # Vetor com no de figurinhas de cada "jogador"
    while (faltantes > 0) {
      # Enquanto o álbum não estiver completo...
      # Simule um pacote de figurinhas
      pacote.aux <-
        sample(1:n.figuras,
               n.pacote,
               replace = T,
               prob = probabilidades)
      figuras.obtidas[pacote.aux] <- figuras.obtidas[pacote.aux] + 1 # Atualize a coleção
      faltantes <- sum(figuras.obtidas == 0) # verifique quantas figurinhas estão faltando
    }
    resultado[simulacao,] <- figuras.obtidas # Salve os valores na linha i-esima linha
  }
  return(resultado)
}


n.figuras <- 670 # Número de figurinhas no álbum
n.pacote <- 5 # Número de figurinhas por pacote
preco <- 4 # Preço por pacote
n.simulacoes <- 100000 # Número de simulações de preenchimento


pesos <- rep(1, n.figuras) # Assumindo chances iguais
probabilidades <- pesos/sum(pesos)
albuns <- gerar.albuns(n.figuras, n.pacote, n.simulacoes, probabilidades)
gasto <- rowSums(albuns) / n.pacote * preco
