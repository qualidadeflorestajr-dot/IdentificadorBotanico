create extension if not exists pgcrypto;
create table if not exists public.trees (
 id uuid primary key default gen_random_uuid(), code text not null unique,
 number text, popular_name text, scientific_name text, family text, origin text,
 height_m numeric, cap_cm numeric, dap_cm numeric, condition text, health text,
 pests text, pruning text, conflicts text, latitude double precision, longitude double precision,
 importance text, fact text, notes text, photo_url text,
 is_published boolean not null default false, created_at timestamptz not null default now(),
 updated_at timestamptz not null default now()
);
create table if not exists public.profiles (
 id uuid primary key references auth.users(id) on delete cascade,
 role text not null default 'public' check(role in ('admin','public')),
 created_at timestamptz not null default now()
);
create table if not exists public.suggestions (
 id uuid primary key default gen_random_uuid(), tree_code text, category text not null,
 message text not null check(char_length(message)>=10), contact text,
 status text not null default 'pending' check(status in ('pending','reviewing','accepted','rejected')),
 admin_notes text, created_at timestamptz not null default now()
);
alter table public.trees enable row level security;
alter table public.profiles enable row level security;
alter table public.suggestions enable row level security;
create policy "public reads published trees" on public.trees
 for select to anon, authenticated using(is_published=true);
create policy "admins manage trees" on public.trees for all to authenticated
 using(exists(select 1 from public.profiles p where p.id=auth.uid() and p.role='admin'))
 with check(exists(select 1 from public.profiles p where p.id=auth.uid() and p.role='admin'));
create policy "public submits suggestions" on public.suggestions for insert to anon, authenticated
 with check(status='pending' and admin_notes is null);
create policy "admins read suggestions" on public.suggestions for select to authenticated
 using(exists(select 1 from public.profiles p where p.id=auth.uid() and p.role='admin'));
create policy "admins moderate suggestions" on public.suggestions for update to authenticated
 using(exists(select 1 from public.profiles p where p.id=auth.uid() and p.role='admin'))
 with check(exists(select 1 from public.profiles p where p.id=auth.uid() and p.role='admin'));
-- Depois de criar a conta autorizada, promover manualmente: update public.profiles set role='admin' where id='UUID_DO_USUARIO';

-- Cada conta criada no Supabase recebe perfil público automaticamente.
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
begin
  insert into public.profiles (id, role)
  values (new.id, 'public')
  on conflict (id) do nothing;
  return new;
end;
$$;
drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
after insert on auth.users
for each row execute procedure public.handle_new_user();

-- O usuário autenticado pode consultar somente o próprio perfil.
create policy "users read own profile" on public.profiles
for select to authenticated using (id = auth.uid());
