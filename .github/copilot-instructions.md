<!--
  Short, actionable instructions for AI coding agents working on this repo.
  Keep this file concise (20-50 lines) and concrete: reference real files,
  explain local-run steps, conventions, and integration points discovered in
  the codebase.
-->
# Copilot / AI Agent Instructions — LTW_Project

- Purpose: Help AI agents be immediately productive modifying the static
  admin/customer web UI. Focus on small, well-scoped changes (HTML/CSS/JS)
  and follow the project's branch/PR rules in `README.md`.

- Repo shape:
  - Admin UI: `admin/pages/*.html`, styles in `admin/styles/`, scripts in `admin/scripts/`.
    Example: `admin/pages/Blog.html` uses `../styles/Blog.css` and `../scripts/Blog.js`.
  - Public root: `index.html` (simple front page / login placeholder).
  - Customer area: `customer/` (separate components, assets, and scripts).
  - Blog uploads: `blog/uploads/images/` — image assets live here and are referenced
    by relative paths in admin pages.

- Key patterns to preserve:
  - Pages are static HTML with client-side JS for UI (tabs, modal forms, sidebar).
  - Relative linking is common (e.g., `../scripts/ThuGonSidebar.js`), so keep relative
    paths and folder structure unchanged when moving files.
  - Accessibility attributes are used (`aria-label`, `role`), keep them intact.
  - Many filenames and visible text are Vietnamese — do not alter user-facing
    copy unless the change is the explicit goal.

- How to run locally (no build system detected):
  - Use a simple static server from the repo root. Example (PowerShell):
    ```powershell
    cd "c:\Lập Trình WEB\Đồ Án Lập Trình Web\LTW_Project"
    python -m http.server 8000
    ```
  - Or use VS Code Live Server extension. Then open `http://localhost:8000/admin/pages/Blog.html`.

- Debugging tips:
  - Use browser DevTools console to trace event handlers (most logic in `admin/scripts/*.js`).
  - Check `admin/pages/*.html` to find which CSS/JS files a page loads before editing.

- Version control and PRs:
  - Do not push directly to `main`. Follow `README.md`: create a feature branch and open a PR.
  - Keep commits small and focused (e.g., "Fix blog editor date parsing").

- When modifying code, search for these example files to understand the intent:
  - `admin/pages/Blog.html`, `admin/scripts/Blog.js`, `admin/scripts/ThuGonSidebar.js`,
    `admin/styles/Blog.css`.

- Constraints for AI edits:
  - Avoid changing global layout or renaming many files in one PR.
  - Preserve relative asset paths and `aria-*` attributes.
  - If you add new JS/CSS files, place them under `admin/scripts` or `admin/styles` and update the HTML that consumes them.

Please review and tell me if you want this expanded with CI/build steps or PR templates.
