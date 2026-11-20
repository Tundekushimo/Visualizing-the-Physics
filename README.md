# Visualizing the Physics

Interactive simulations for Physics I, Physics II, and the physics inside everyday technology.
Each lab has a live simulation, adjustable parameters, a data table, graphing with a linear fit, CSV export, and a lab guide.

## Files
- `src/physics-bench.html`: the master copy. Make every change here.
- `build.ps1`: turns the master copy into `index.html`.
- `index.html`: the page GitHub Pages serves. Never edit it by hand; rebuild it.

The site is a single self-contained page. It needs no server code, database or login.
It loads fonts from Google Fonts; without them it falls back to system fonts.

## Publishing an update
1. Change `src/physics-bench.html` (or ask Claude to).
2. Update `APP_VERSION` near the top of the script.
3. Build:  `powershell -ExecutionPolicy Bypass -File build.ps1`
4. Open `index.html` in a browser and check the labs you changed.
5. Commit and push:
   ```
   git add -A
   git commit -m "Short description of the change"
   git push
   ```
6. GitHub Pages republishes the site within a few minutes at the same address.

To undo a bad update, revert that commit on GitHub (or `git revert <commit>`) and push.

## Feedback
Paste a Microsoft Forms or Qualtrics link into `FEEDBACK_URL` near the top of the script, rebuild and push.
The "Send feedback" button then appears in the page footer. Colleagues can also open Issues on the GitHub repository.
