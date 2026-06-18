create table public.posts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.users(id) on delete cascade,
  title text not null,
  content text,
  published boolean default false,
  created_at timestamptz default now()
);

alter table public.posts enable row level security;
