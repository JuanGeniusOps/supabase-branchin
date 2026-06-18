create policy "Anyone can read published posts"
  on public.posts for select
  using (published = true);

create policy "Users can read own posts"
  on public.posts for select
  using (auth.uid() = user_id);

create policy "Users can create own posts"
  on public.posts for insert
  with check (auth.uid() = user_id);

create policy "Users can update own posts"
  on public.posts for update
  using (auth.uid() = user_id);

create policy "Users can delete own posts"
  on public.posts for delete
  using (auth.uid() = user_id);
