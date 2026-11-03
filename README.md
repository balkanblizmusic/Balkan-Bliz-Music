# Balkan BLiZ Music — Supabase-connected version

Preserves the original dark/pink/purple visual design while replacing browser-only demo moderation with real Supabase Auth, Storage and database moderation.

## Install (mobile friendly)
1. In Supabase > SQL Editor run `SETUP-SUPABASE.sql` once. This assumes you already ran the initial database SQL (music_profiles, music_admins, music_tracks and private music-uploads bucket).
2. In GitHub repo `balkanblizmusic/Balkan-Bliz-Music`, replace the existing `index.html` with this version (upload files, commit changes). You may also replace README.md.
3. In Supabase > Authentication > URL Configuration set Site URL to `https://balkanblizmusic.github.io/Balkan-Bliz-Music/` and add that address as a Redirect URL if email confirmation is enabled.
4. Sign in with the email/password of the user whose UID was added to `music_admins`.

## Notes
- The browser uses ONLY the publishable key, never the secret key.
- Uploaded audio is private until approved; approved songs are accessible to public visitors using time-limited signed URLs.
- This first connected release includes email/password sign-up, login, logout, submissions, public playback, admin review and submission status.
- Audio limit: 50 MB, MP3/WAV/OGG. Storage quotas and upload limits depend on the Supabase plan.
- For large-scale production, add rate limits, abuse reports, stronger file verification and a server-side cleanup job for rejected/orphaned files.
