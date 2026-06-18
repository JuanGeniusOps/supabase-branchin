-- Los usuarios pueden leer posts publicados
create policy "Anyone can read published posts"
  on public.posts for select
  using (published = true);

-- Los usuarios solo pueden leer sus propios posts no publicados
create policy "Users can read own posts"
  on public.posts for select
  using (auth.uid() = user_id);

-- Los usuarios solo pueden crear posts propios
create policy "Users can create own posts"
  on public.posts for insert
  with check (auth.uid() = user_id);

-- Los usuarios solo pueden editar sus propios posts
create policy "Users can update own posts"
  on public.posts for update
  using (auth.uid() = user_id);

-- Los usuarios solo pueden borrar sus propios posts
create policy "Users can delete own posts"
  on public.posts for delete
  using (auth.uid() = user_id);
