# One-way sync from the private pics-* theme in dotfiles (source of truth: pics-themes/gen_colors.py)
SLUG := $(shell basename $(CURDIR) | sed 's/^omarchy-//; s/-theme$$//')
LOCAL := $(HOME)/.config/omarchy/themes/pics-$(SLUG)

sync:
	cp $(LOCAL)/colors.toml $(LOCAL)/icons.theme .
	@sed -i '1s|.*|# $(SLUG) — Omarchy theme generated from personal photos (https://github.com/sspaeti/omarchy-$(SLUG)-theme)|' colors.toml
	@git status --short

preview:
	omarchy theme set $(SLUG)
	@echo "take a screenshot, save as preview.png (and preview-unlock.png / unlock.png if wanted)"
