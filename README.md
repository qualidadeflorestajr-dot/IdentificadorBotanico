# Árvores de Nazareno 🌳

Aplicação inicial para o projeto **Árvores da Praça Central de Nazareno – MG**, baseada no documento de projeto fornecido.

## O que já existe neste protótipo

- Painel administrativo com indicadores do inventário.
- Cadastro e edição de árvores com os campos previstos no projeto.
- Cálculo automático do DAP a partir do CAP (CAP ÷ π).
- Registro fotográfico local.
- Busca e filtro de árvores.
- Mapa com pontos georreferenciados (Leaflet + OpenStreetMap).
- Ficha pública individual por árvore.
- Geração de QR Code apontando para a ficha.
- Layout adaptado para celular e computador.

## Como executar

Abra `index.html` em um navegador ou publique o conteúdo deste repositório pelo GitHub Pages (Settings → Pages → Deploy from a branch → main → /(root)).

## Limitações importantes desta primeira versão

Esta é uma **demonstração front-end**: os dados ficam no armazenamento local do navegador (`localStorage`). Portanto, não são compartilhados entre aparelhos, navegadores ou usuários e podem ser perdidos se os dados do navegador forem apagados. As fotografias também ficam armazenadas localmente.

Para uso oficial pela Prefeitura e leitura pública dos QR Codes, a próxima etapa deverá integrar um banco de dados on-line, armazenamento de imagens, autenticação administrativa e hospedagem pública. Não inserir dados pessoais ou informações operacionais sensíveis nesta versão de demonstração.

## Identificação

Padrão de códigos: `NAZ-PRA-001`, `NAZ-PRA-002` etc. A identificação botânica deve permanecer como pendente quando não houver confirmação técnica.

## Tecnologias

HTML, CSS e JavaScript; Leaflet/OpenStreetMap para mapa; QRCode.js para QR Codes.
