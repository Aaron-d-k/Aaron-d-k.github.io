# Makefile

# Define the build command for the dependency.
DEPS_BUILD = cd lifeviewer/build && ./compile.sh && cp ./lv-plugin.js ../../static/js/ && cd ../../assets && bash makegif.sh

# Define the Hugo commands
HUGO_BUILD = hugo --minify
HUGO_DEV = hugo server -D

# --- TASKS ---

# Task to build the dependency
build_deps:
	@echo "--- Building Dependencies ---"
	@$(DEPS_BUILD)

# Task to build the final site for production
build: build_deps
	@echo "--- Building Hugo Site ---"
	@$(HUGO_BUILD)

# Task to run the dev server
dev: build_deps
	@echo "--- Starting Hugo Server ---"
	@$(HUGO_DEV)

# A task to clean up built files
clean:
	@echo "--- Cleaning up ---"
	@rm -rf public resources
	@rm -f static/js/output.js

.PHONY: build_deps build dev clean