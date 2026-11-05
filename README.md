# Árvores de Nazareno 🌳

Inventário arbóreo e educação ambiental de Nazareno – MG.

## Direção definida
- Site e aplicativo: aplicação web responsiva instalável (PWA).
- Administradores: cadastro/edição do inventário e moderação das sugestões.
- População: consulta pública das fichas e envio de sugestões.

## Protótipo
- Painel e formulário de árvores; dados botânicos, dendrométricos e fitossanitários.
- Cálculo DAP = CAP ÷ π; busca, mapa, fichas públicas e QR Code.
- Estrutura PWA e formulário de sugestões preparado para Supabase.

## Limitações e segurança
Ainda é um protótipo. O inventário existente usa armazenamento local e não é compartilhado entre aparelhos. O envio de sugestões só funciona após configurar Supabase e aplicar `supabase-schema.sql`. A autenticação administrativa e a migração do inventário para o banco on-line ainda precisam ser concluídas. Não usar oficialmente antes desses passos e dos testes de segurança. Nunca colocar a chave `service_role` no front-end; usar somente a chave pública anon com RLS corretamente configurado.

## Configuração do backend
1. Criar projeto Supabase.
2. Executar `supabase-schema.sql` no SQL Editor.
3. Copiar `config.example.js` para `config.js` e preencher URL e chave pública anon.
4. Criar conta do administrador e promover o perfil manualmente, conforme comentário no SQL.
5. Concluir autenticação administrativa, sincronização do inventário e armazenamento de fotos.

## Publicação
GitHub → Settings → Pages → Deploy from a branch → main → /(root). Publicar após configurar e testar permissões.

## Tecnologias
HTML, CSS, JavaScript, Leaflet/OpenStreetMap, QRCode.js e Supabase (backend em configuração).
