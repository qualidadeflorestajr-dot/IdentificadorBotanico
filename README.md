# Árvores de Nazareno — aplicativo Android

Projeto de aplicativo Android (APK) para inventário arbóreo e educação ambiental da Praça Central de Nazareno–MG, expansível para outras praças, parques e áreas verdes do município.

## Plataforma e funcionamento
- O produto de entrega é um **APK Android compilado com Capacitor**.
- A interface é empacotada dentro do APK em `www/`; o aplicativo não depende de abrir o GitHub Pages como página remota.
- O Supabase permanece como backend online para autenticação, banco de dados e sincronização entre equipe e população. É necessária conexão com a internet para consultar e sincronizar os dados.
- O projeto web em `index.html`, `styles.css` e `app.js` é a camada de interface do aplicativo híbrido Android, não o produto final de entrega.

## Roteiro obrigatório do projeto
1. Inventário individual das árvores, com código padronizado (ex.: `NAZ-PRA-001`), número, espécie, nome popular e científico, família e origem.
2. Dendrometria: CAP, DAP calculado automaticamente e altura estimada.
3. Avaliação da condição geral e fitossanitária, pragas/doenças, poda e conflitos urbanos.
4. Registro fotográfico da árvore inteira, tronco, copa e detalhes botânicos.
5. Geolocalização por coordenadas e mapa interativo da Praça Central.
6. QR Code individual para identificação e acesso à ficha.
7. Consulta pública das fichas, características, fotografias, importância ambiental e curiosidades.
8. Área administrativa autenticada para cadastrar, editar, publicar e moderar contribuições.
9. Gestão de manejo, histórico de intervenções, sugestões e exportação dos dados.
10. Educação ambiental e Circuito das Árvores, com material informativo.

## Preparar e testar a interface no Codespaces
```bash
npm install
npm run dev
```
A prévia local serve para testar a interface; ela não é o APK.

## Gerar o APK localmente
```bash
npm install
npm run build:apk
```
O arquivo gerado fica em `android/app/build/outputs/apk/debug/app-debug.apk`.

## Gerar APK pelo GitHub Actions
1. Abra a aba **Actions** do repositório.
2. Selecione **Build Android APK**.
3. Clique em **Run workflow**.
4. Quando terminar com sucesso, baixe o artefato `arvores-de-nazareno-apk`.

## Supabase
1. Configure `config.js` com a Project URL e a Publishable key. Nunca coloque `sb_secret_` ou `service_role` no aplicativo.
2. Execute `supabase-schema.sql` e depois `supabase-upgrade.sql` no SQL Editor.
3. Crie o usuário da equipe em Authentication > Users e atribua a função administrativa em `profiles`.
4. Mantenha políticas RLS habilitadas. Não exponha credenciais administrativas no APK.

## Integridade do inventário
Não inventar espécies, coordenadas, medições, datas ou fotografias. Campos sem levantamento devem permanecer como não informados ou identificação pendente. O inventário começa pela Praça Central de Nazareno–MG.
