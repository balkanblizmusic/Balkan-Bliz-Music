-- Run this in your existing Balkan BLiZ Music Supabase SQL Editor.
-- This adds public playback of APPROVED songs without exposing pending uploads.
-- Keep the bucket PRIVATE. Never put a secret API key in the website.

-- Anonymous visitors may request a signed playback URL ONLY for approved tracks.
create policy "Public may play approved music"
on storage.objects for select to anon
using (
  bucket_id = 'music-uploads'
  and exists (
    select 1 from public.music_tracks t
    where t.audio_path = name and t.status = 'approved'
  )
);

-- The original authenticated policy already allows owners, admins, and approved music.
-- Optional: permit users to remove orphaned files in their own folder.
create policy "Users remove own music files"
on storage.objects for delete to authenticated
using (
  bucket_id = 'music-uploads'
  and (storage.foldername(name))[1] = (select auth.uid())::text
);
