# Árvores de Nazareno

Aplicação web responsiva e instalável (PWA) para inventário arbóreo e educação ambiental em Nazareno–MG.

## Recursos
- Catálogo público com busca, filtro e fichas de árvores publicadas.
- Formulário público de sugestões.
- Login administrativo com Supabase Auth.
- Painel restrito para cadastrar, editar, publicar/despublicar e excluir árvores.
- Moderação de sugestões.
- Cálculo automático do DAP quando o CAP é informado e o DAP fica vazio.
- Layout responsivo para celular e computador.

## Configuração
1. Preencha `config.js` com a Project URL e a Publishable key do Supabase. Nunca coloque `sb_secret_` ou `service_role` no navegador.
2. No Supabase, abra SQL Editor e execute o conteúdo completo de `supabase-schema.sql`. O script pode ser executado novamente para atualizar políticas.
3. No Supabase, abra Authentication > Users e crie o usuário da equipe (e-mail e senha).
4. Copie o UUID do usuário criado. No SQL Editor, execute:
   `update public.profiles set role = 'admin' where id = 'UUID-DO-USUARIO';`
5. Publique o site em hospedagem HTTPS (por exemplo, GitHub Pages). O PWA requer HTTPS para instalação e service worker.

## Importante
- Somente fichas com `is_published = true` aparecem no catálogo público.
- O perfil criado automaticamente recebe papel `public`; a promoção para `admin` é manual e deve ser feita por pessoa autorizada.
- Fotografias são cadastradas por URL pública em `photo_url`. Para upload direto de arquivos, configure um bucket privado/público no Supabase Storage e políticas próprias.
- O projeto precisa ser publicado em HTTPS para login, QR codes compartilháveis e instalação como PWA funcionarem corretamente.
- Não cadastre informações inventadas: use dados de campo verificados.
