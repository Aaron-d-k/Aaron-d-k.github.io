# Makefile

# Define the build command for the dependency.
DEPS_BUILD = cd lifeviewer/build && ./compile.sh && cp ./lv-plugin.js ../../static/js/ && cd ../../assets && bash makegif.sh

# Define the Hugo commands
HUGO_BUILD = hugo --minify
HUGO_DEV = hugo server -D

# --- TASKS ---

# Task to build the dependency
static/js/lv-plugin.js:
	@echo "--- Building Lifeviewer ---"
	cd lifeviewer/build && ./compile.sh && cp ./lv-plugin.js ../../static/js/

static/generated-content/ising.gif:
	@echo "--- Making Ising GIF ---"
	cd content-generators && yes | bash makegif.sh

# Task to build the final site for production
build: static/js/lv-plugin.js static/generated-content/ising.gif
	@echo "--- Building Hugo Site ---"
	@$(HUGO_BUILD)

# Task to run the dev server
dev: static/js/lv-plugin.js static/generated-content/ising.gif
	@echo "--- Starting Hugo Server ---"
	@$(HUGO_DEV)

# A task to clean up built files
clean:
	@echo "--- Cleaning up ---"
	@rm -rf public resources
	@rm -f static/js/lv-plugin.js
	@rm -f static/generated-content/*

.PHONY: build dev clean