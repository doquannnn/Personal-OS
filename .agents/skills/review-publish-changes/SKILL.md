---
name: review-publish-changes
description: Review, validate, commit, push, and merge intended changes in the Personal OS repository. Use when asked to finish, publish, or integrate the current working tree; do not use for ordinary implementation work that is not ready to ship.
---

# Review and Publish Personal OS Changes

Finish the repository's current work without broadening its scope.

## Workflow

1. Read repository instructions, then inspect `git status`, staged and unstaged diffs, untracked files, the current branch, remotes, and recent history.
2. Separate intended changes from unrelated work. Do not stage unrelated files. If intent cannot be determined safely, stop and identify the ambiguous files.
3. Review the intended diff for correctness, secrets, generated artifacts, incomplete scaffolding, and consistency with the architecture in `README.md`.
4. Detect the relevant validation commands from committed project configuration. Run focused tests and lint first, then broader checks when available. During the documentation-only scaffold phase, validate the changed artifacts directly and report that no application test suite exists.
5. If currently on `main` or `master`, create a descriptive branch prefixed with `codex/`. Otherwise keep the current branch unless the user requested a different branch.
6. Stage only intended paths and re-check the staged diff. Commit with a clear Conventional Commit message whose type and scope match the actual change.
7. Push the working branch to `origin` and set upstream tracking when needed.
8. Merge into the repository's primary branch only when all checks pass and the merge is conflict-free. Update the local primary branch from `origin` before merging, avoid rewriting history, then push it.
9. Report the working branch, commit hash and message, validation commands and results, and merge/push result.

## Stop Conditions

- Never commit credentials, environment secrets, unrelated files, or unexplained generated output.
- Do not bypass failing checks. Diagnose them and stop unless the requested work clearly includes the fix.
- Resolve a merge conflict only when repository evidence makes the correct result unambiguous. Otherwise abort the merge and explain each conflict.
- Do not force-push, delete branches, rewrite commits, or use destructive cleanup unless the user explicitly requests it.
- Treat pushes and merges as authorized only when the current request explicitly asks for them.
