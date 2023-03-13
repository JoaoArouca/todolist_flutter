# Teste Flutter - Parte teórica

 - *O que é o Flutter?*
    R. `Flutter é um kit de desenvolvimento de software (SDK) criado pelo Google para criar aplicativos para dispositivos móveis, web e desktop a partir de um único código-fonte. Ele é baseado na linguagem de programação Dart e oferece uma ampla variedade de recursos, incluindo widgets personalizados, ferramentas de desenvolvimento robustas e uma interface de usuário reativa.`
    `Uma das principais vantagens do Flutter é que ele permite aos desenvolvedores criar aplicativos nativos de alta qualidade para múltiplas plataformas com rapidez e eficiência.`

 - *Quais são as principais diferenças entre Flutter e outros frameworks de desenvolvimento mobile?*
    R.
    . `Flutter usa a linguagem de programação Dart, enquanto outros frameworks como React Native, Ionic e Xamarin usam JavaScript, TypeScript, HTML/CSS e C# respectivamente.`
    . `O Flutter oferece um excelente desempenho em comparação com outros frameworks devido ao seu mecanismo de renderização personalizado, que oferece alta velocidade e eficiência.`
    . `Flutter possui uma ampla variedade de widgets personalizados que são altamente personalizáveis, enquanto outros frameworks dependem de bibliotecas de terceiros para obter recursos semelhantes.`
    . `O Flutter tem uma interface de usuário reativa, o que significa que as alterações na interface do usuário são refletidas imediatamente, proporcionando uma experiência de usuário mais fluida.(Hot reload)`
    . `Flutter permite desenvolver aplicativos para várias plataformas, incluindo Android, iOS, web e desktop, usando um único conjunto de código-fonte. Diferentes de linguagens como Kotlin e Swift que são códigos nativos para Android e IOS respectivamente.`

 - *O que é um Widget em Flutter?*
    `R. Em Flutter, um widget é um elemento básico de interface do usuário que pode ser combinado para criar a interface completa do aplicativo. Na verdade, em Flutter, tudo o que você vê na tela é um widget, desde um simples botão até uma tela de login completa.`

 - *O que é o setState() em Flutter?*
    R. `Em Flutter, o setState() é um método usado para atualizar o estado de um widget stateful. Quando um widget stateful é criado, ele possui um estado inicial que é definido no método createState(). No entanto, à medida que o aplicativo é executado, o estado pode mudar e, quando isso acontece, o setState() é usado para notificar o Flutter que o estado foi alterado e que a interface do usuário precisa ser atualizada para refletir as mudanças.`

 - *O que é um StatelessWidget e um StatefulWidget em Flutter?*
    R. `Um StatelessWidget é um widget que não tem estado interno e, portanto, não pode ser atualizado durante a execução do aplicativo. Isso significa que o conteúdo de um StatelessWidget é fixo e não muda à medida que o aplicativo é executado. Exemplos de StatelessWidget incluem botões, rótulos, imagens, ícones e muito mais. Quando um StatelessWidget é construído, seu conteúdo é definido e permanece o mesmo até que o widget seja descartado e reconstruído novamente.`
    `Por outro lado, um StatefulWidget é um widget que possui estado interno e, portanto, pode ser atualizado durante a execução do aplicativo. Isso significa que o conteúdo de um StatefulWidget pode mudar à medida que o aplicativo é executado, com base nas interações do usuário ou em outras mudanças no estado do aplicativo. Quando um StatefulWidget é construído, seu estado inicial é definido no método createState(), e esse estado pode ser atualizado posteriormente usando o método setState().`
    `Em resumo, um StatelessWidget é usado para criar widgets cujo conteúdo é fixo e não muda durante a execução do aplicativo, enquanto um StatefulWidget é usado para criar widgets cujo conteúdo pode mudar com base no estado do aplicativo. Ambos os widgets são usados extensivamente em aplicativos Flutter para criar interfaces de usuário complexas e personalizadas.`