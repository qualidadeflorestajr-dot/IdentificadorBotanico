-- Atualização segura do inventário arbóreo. Não remove dados existentes.
alter table public.trees
  add column if not exists site_name text default 'Praça Central de Nazareno',
  add column if not exists survey_date date,
  add column if not exists responsible text,
  add column if not exists planting_date date,
  add column if not exists photo_urls text[] not null default '{}',
  add column if not exists photo_trunk_url text,
  add column if not exists photo_canopy_url text,
  add column if not exists photo_detail_url text;

create table if not exists public.tree_maintenance (
  id uuid primary key default gen_random_uuid(),
  tree_id uuid not null references public.trees(id) on delete cascade,
  action_date date not null default current_date,
  action_type text not null,
  description text,
  responsible text,
  created_at timestamptz not null default now()
);

alter table public.tree_maintenance enable row level security;
grant select on public.tree_maintenance to anon, authenticated;
grant insert, update, delete on public.tree_maintenance to authenticated;

drop policy if exists "public reads maintenance of published trees" on public.tree_maintenance;
create policy "public reads maintenance of published trees"
on public.tree_maintenance for select to anon, authenticated
using (exists (select 1 from public.trees t where t.id = tree_id and t.is_published = true));

drop policy if exists "admins manage maintenance" on public.tree_maintenance;
create policy "admins manage maintenance"
on public.tree_maintenance for all to authenticated
using (exists (select 1 from public.profiles p where p.id = auth.uid() and p.role = 'admin'))
with check (exists (select 1 from public.profiles p where p.id = auth.uid() and p.role = 'admin'));

create index if not exists tree_maintenance_tree_date_idx
on public.tree_maintenance(tree_id, action_date desc);
